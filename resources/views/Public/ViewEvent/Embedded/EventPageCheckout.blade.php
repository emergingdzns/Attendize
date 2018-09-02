@extends('Public.ViewEvent.Layouts.EmbeddedEventPage')

@section('head')
    @if($event->account->active_payment_gateway->name == 'Stripe')
        <script type="text/javascript" src="https://js.stripe.com/v2/"></script>
    @endif
@stop

@section('content')
    @include('Public.ViewEvent.Partials.EventCreateOrderSection')
    @include('Public.ViewEvent.Embedded.Partials.PoweredByEmbedded')
    <script> var OrderExpires = {{strtotime($expires)}};</script>
@stop

