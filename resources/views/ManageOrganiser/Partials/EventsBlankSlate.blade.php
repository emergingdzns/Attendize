@extends('Shared.Layouts.BlankSlate')

@section('blankslate-icon-class')
    ico-ticket
@stop

@section('blankslate-title')
    @lang("Event.no_events_yet")
@stop

@section('blankslate-text')
    @if(Auth::user()->isAdmin())
        @lang("Event.no_events_yet_text")
    @else
        @lang("Event.non_admin_events_yet_text")
    @endif
@stop

@section('blankslate-body')
    @if(Auth::user()->isAdmin())
<button data-invoke="modal" data-modal-id="CreateEvent" data-href="{{route('showCreateEvent', ['organiser_id' => $organiser->id])}}" href='javascript:void(0);'  class="btn btn-success mt5 btn-lg" type="button">
    <i class="ico-ticket"></i>
    @lang("Event.create_event")
</button>
    @endif
@stop


