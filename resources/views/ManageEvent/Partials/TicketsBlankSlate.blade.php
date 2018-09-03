@extends('Shared.Layouts.BlankSlate')

@section('blankslate-icon-class')
    ico-ticket
@stop

@section('blankslate-title')
    @lang("Ticket.no_tickets_yet")
@stop

@section('blankslate-text')
    @if(Auth::user()->isAdmin())
        @lang("Ticket.no_tickets_yet_text")
    @else
        @lang("Ticket.non_admin_no_tickets_yet_text")
    @endif
@stop

@section('blankslate-body')
    @if(Auth::user()->isAdmin())
        <button data-invoke="modal" data-modal-id='CreateTicket' data-href="{{route('showCreateTicket', array('event_id'=>$event->id))}}" href='javascript:void(0);'  class=' btn btn-success mt5 btn-lg' type="button" >
            <i class="ico-ticket"></i>
            @lang("Ticket.create_ticket")
        </button>
    @endif
@stop
