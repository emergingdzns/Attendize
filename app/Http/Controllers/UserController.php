<?php

namespace App\Http\Controllers;

use Auth;
use Hash;
use Illuminate\Http\Request;
use Validator;

use App\Models\User;
use App\Models\Organiser;

class UserController extends Controller
{
    /**
     * Show the edit user modal
     *
     * @return \Illuminate\Contracts\View\View
     */
    public function showEditUser($userId = null)
    {
        if ($userId) {
            $data = [
                'user' => User::find($userId),
            ];
        } else {
            $data = [
                'user' => Auth::user(),
            ];
        }

        $data['organisers'] = Organiser::scope()->get();

        return view('ManageUser.Modals.EditUser', $data);
    }

    /**
     * Updates the current user
     *
     * @param Request $request
     * @return mixed
     */
    public function postEditUser(Request $request)
    {
        if (@$request->get('user_id') && (Auth::user()->isAdmin() || Auth::user()->id == $request->get('user_id'))) {
            $user = User::find($request->get('user_id'));
        } else {
            response()->json(['status' => 'error', 'message' => trans("Controllers.error_not_admin")]);
        }

        $rules = [
            'email'        => [
                'required',
                'email',
                'unique:users,email,' . $user->id . ',id,account_id,' . $user->account_id
            ],
            'new_password' => ['min:5', 'confirmed', 'required_with:password'],
            'password'     => 'passcheck',
            'first_name'   => ['required'],
            'last_name'    => ['required'],
        ];

        $messages = [
            'email.email'         => trans("Controllers.error.email.email"),
            'email.required'      => trans("Controllers.error.email.required"),
            'password.passcheck'  => trans("Controllers.error.password.passcheck"),
            'email.unique'        => trans("Controllers.error.email.unique"),
            'first_name.required' => trans("Controllers.error.first_name.required"),
            'last_name.required'  => trans("Controllers.error.last_name.required"),
        ];

        $validation = Validator::make($request->all(), $rules, $messages);

        if ($validation->fails()) {
            return response()->json([
                'status'   => 'error',
                'messages' => $validation->messages()->toArray(),
            ]);
        }

        if ($request->get('password')) {
            $user->password = Hash::make($request->get('new_password'));
        }

        $user->first_name = $request->get('first_name');
        $user->last_name = $request->get('last_name');
        $user->email = $request->get('email');

        if ($request->has('organisers') && count($request->get('organisers') > 0)) {
            $organisers = [];
            foreach($request->get('organisers') as $org) {
                if ($org != '') {
                    $organisers[] = $org;
                }
            }
            if (count($organisers) > 0) {
                $user->organisers()->sync($organisers);
            }
        }

        $user->save();

        return response()->json([
            'status'  => 'success',
            'message' => trans("Controllers.successfully_saved_details"),
        ]);
    }

    public function deleteUser(Request $request)
    {
        // To Do: make these strings translations
        if (Auth::user()->isAdmin() === false) {
            return response()->json(['status'=>'error','message'=>trans("Controllers.error_not_admin")]);
        }

        if (!@$request->get('user_id')) {
            return response()->json(['status'=>'error','message'=>trans("Controllers.error_no_user_id")]);
        }

        if (Auth::user()->id == $request->get('user_id')) {
            return response()->json(['status'=>'error','message'=>trans("Controllers.error_can_not_delete_self")]);
        }

        $user = User::find($request->get('user_id'));
        if (!@$user) {
            return response()->json(['status'=>'error','message'=>trans("Controllers.error_can_not_find_user")]);
        } else {
            $user->organisers()->sync([]);
            $user->delete();
            return response()->json(['status'=>'success']);
        }

    }
}
