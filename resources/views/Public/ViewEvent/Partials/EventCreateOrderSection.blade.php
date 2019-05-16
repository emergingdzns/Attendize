<section id='order_form' class="container">
    <div class="row">
        <h1 class="section_head">
            @lang("Public_ViewEvent.order_details")
        </h1>
    </div>
    <div class="row">
        <div class="col-md-12" style="text-align: center">
            @lang("Public_ViewEvent.below_order_details_header")
        </div>
        <div class="col-md-4 col-md-push-8">
            <div class="panel">
                <div class="panel-heading">
                    <h3 class="panel-title">
                        <i class="ico-cart mr5"></i>
                        @lang("Public_ViewEvent.order_summary")
                    </h3>
                </div>

                <div class="panel-body pt0">
                    <table class="table mb0 table-condensed">
                        @foreach($tickets as $ticket)
                        <tr>
                            <td class="pl0">{{{$ticket['ticket']['title']}}}
                                @if($ticket['is_deposit'])
                                    (Deposit)
                                @endif
                                X <b>{{$ticket['qty']}}</b></td>
                            @if((int)ceil($ticket['full_price']) !== 0)
                            <td style="text-align: right;">
                                {{ money($ticket['ticket']->price, $event->currency) }}
                            </td>
                            @endif
                        </tr>
                        @endforeach
                    </table>
                </div>
                @if($order_total > 0)
                    @if($ticket['is_deposit'])
                        <div class="panel-footer">
                            <h5>
                                Tickets (Full Price): <span style="float: right;"><b>{{ money($full['total'], $event->currency) }}</b></span>
                            </h5>
                            @if($full['organiser_booking_fee'] > 0)
                                <h5>
                                    4% Surcharge <sup>*</sup>: <span style="float: right;"><b>{{ money($full['organiser_booking_fee'], $event->currency) }}</b></span>
                                </h5>
                            @endif
                            <h5>
                                Subtotal: <span style="float: right;"><b>{{ money(($full['total']+($full['booking_fee']+$full['organiser_booking_fee'])), $event->currency) }}</b></span>
                            </h5>
                            @if($full['gratuity'] > 0)
                                <h5>
                                    Gratuity<?php if ($event->gratuity_percentage > 0): ?> ({{$event->gratuity_percentage}}%)<?php endif; ?>:
                                    <span style="float: right;"><b>{{ money($full['gratuity'], $event->currency) }}</b></span>
                                </h5>
                            @endif
                            @if($event->organiser->charge_tax && $event->charge_tax)
                                <h5>
                                    {{ $event->organiser->tax_name }} ({{ $event->organiser->tax_value }}%):
                                    <?php /*$orderService->getTaxFullAmount(true)*/ ?>
                                    <span style="float: right;"><b>{{ money((($full['total']+$full['gratuity'])*($event->organiser->tax_value/100)), $event->currency) }}</b></span>
                                </h5>
                            @endif
                            <hr>
                            <h5>
                                <strong><span style="font-size:120%;font-weight:600;">Due Now:</span></strong>
                                <span style="float: right;"><span style="font-size:120%;font-weight:600;">{{  money($order_total, $event->currency) }}</span></span>
                            </h5>
                            @if($balance_due>0)
                                <hr>
                                <h5>
                                    <strong>Due at Event:</strong>
                                    <span style="float: right;"><b>{{ money(($full['total'] + $full['gratuity'] + $full['organiser_booking_fee'] + (($full['total']+$full['gratuity'])*($event->organiser->tax_value/100)) - $order_total), $event->currency) }}</b></span>
                                </h5>
                            @endif
                        </div>
                    @else
                        <div class="panel-footer">
                            <h5>
                                Tickets: <span style="float: right;"><b>{{ money($ticket['price'], $event->currency) }}</b></span>
                            </h5>
                            @if($ticket['ticket']->total_booking_fee > 0)
                                <h5>
                                    4% Surcharge <sup>*</sup>: <span style="float: right;"><b>{{ money(($ticket['ticket']->total_booking_fee * $ticket['qty']), $event->currency) }}</b></span>
                                </h5>
                            @endif
                            <h5>
                                Subtotal: <span style="float: right;"><b>{{ money(($ticket['price']+($ticket['ticket']->total_booking_fee * $ticket['qty'])), $event->currency) }}</b></span>
                            </h5>
                            @if($event->organiser->charge_tax && $event->charge_tax)
                            <!-- TODO: Suggested change: put gratuity before tax? -->
                            @if($ticket['gratuity'] > 0)
                                <h5>
                                    Gratuity<?php if ($event->gratuity_percentage > 0): ?> ({{$event->gratuity_percentage}}%)<?php endif; ?>:
                                    <span style="float: right;"><b>{{ money($ticket['gratuity'], $event->currency) }}</b></span>
                                </h5>
                            @endif
                            <h5>
                                {{ $event->organiser->tax_name }} ({{ $event->organiser->tax_value }}%):
                                <span style="float: right;"><b>{{ $orderService->getTaxAmount(true) }}</b></span>
                            </h5>
                            <hr>
                            <h5>
                                <strong>Grand Total:</strong>
                                <span style="float: right;"><b>{{  $orderService->getGrandTotal(true) }}</b></span>
                            </h5>
                            @endif
                            @if($balance_due>0)
                                <hr>
                                <h5>
                                    <strong>Due at Event:</strong>
                                    <span style="float: right;"><b>{{ money($balance_due, $event->currency) }}</b></span>
                                </h5>
                            @endif
                        </div>
                    @endif
                @endif

            </div>
            <div class="help-block">
                {!! @trans("Public_ViewEvent.time", ["time"=>"<span id='countdown'></span>"]) !!}
            </div>
            <!-- New Gratuity Explanation Here -->
            @if($ticket['ticket']->total_booking_fee > 0)
            <div class="help-block">
                <sup>*</sup> {!! @trans("Public_ViewEvent.booking_fees_explanation_percent", ["percent"=>number_format($event->organiser_fee_percentage, 0) . '%']) !!}
            </div>
            @endif
        </div>
        <div class="col-md-8 col-md-pull-4">
            <div class="event_order_form">
                @if($event->account->active_payment_gateway->name == 'Stripe')
                    {!! Form::open(['url' => route('postCreateOrder', ['event_id' => $event->id]), 'class' => ($order_requires_payment && @$payment_gateway->is_on_site) ? 'ajax payment-form' : 'ajax', 'data-stripe-pub-key' => isset($account_payment_gateway->config['publishableKey']) ? $account_payment_gateway->config['publishableKey'] : '']) !!}
                @else
                    {!! Form::open(['url' => route('postCreateOrder', ['event_id' => $event->id]), 'class' => 'payment-form']) !!}
                @endif
                {!! Form::hidden('event_id', $event->id) !!}

                <h3> @lang("Public_ViewEvent.your_information")</h3>

                <div class="row">
                    <div class="col-xs-6">
                        <div class="form-group">
                            {!! Form::label("order_first_name", trans("Public_ViewEvent.first_name")) !!}
                            {!! Form::text("order_first_name", null, ['required' => 'required', 'class' => 'form-control']) !!}
                        </div>
                    </div>
                    <div class="col-xs-6">
                        <div class="form-group">
                            {!! Form::label("order_last_name", trans("Public_ViewEvent.last_name")) !!}
                            {!! Form::text("order_last_name", null, ['required' => 'required', 'class' => 'form-control']) !!}
                        </div>
                    </div>
                </div>

                <div class="row">
                    <div class="col-md-12">
                        <div class="form-group">
                            {!! Form::label("order_email", trans("Public_ViewEvent.email")) !!}
                            {!! Form::text("order_email", null, ['required' => 'required', 'class' => 'form-control']) !!}
                        </div>
                    </div>
                </div>

                <div class="p20 pl0">
                    <a href="javascript:void(0);" class="btn btn-primary btn-xs" id="mirror_buyer_info">
                        @lang("Public_ViewEvent.copy_buyer")
                    </a>
                </div>

                <div class="row">
                    <div class="col-md-12">
                        <div class="ticket_holders_details" >
                            <h3>@lang("Public_ViewEvent.ticket_holder_information")</h3>
                            <?php
                                $total_attendee_increment = 0;
                            ?>
                            @foreach($tickets as $ticket)
                                @for($i=0; $i<=$ticket['qty']-1; $i++)
                                <div class="panel panel-primary">

                                    <div class="panel-heading">
                                        <h3 class="panel-title">
                                            <b>{{$ticket['ticket']['title']}}</b>: @lang("Public_ViewEvent.ticket_holder_n", ["n"=>$i+1])
                                        </h3>
                                    </div>
                                    <div class="panel-body">
                                        <div class="row">
                                            <div class="col-md-6">
                                                <div class="form-group">
                                                    {!! Form::label("ticket_holder_first_name[{$i}][{$ticket['ticket']['id']}]", trans("Public_ViewEvent.first_name")) !!}
                                                    {!! Form::text("ticket_holder_first_name[{$i}][{$ticket['ticket']['id']}]", null, ['required' => 'required', 'class' => "ticket_holder_first_name.$i.{$ticket['ticket']['id']} ticket_holder_first_name form-control"]) !!}
                                                </div>
                                            </div>
                                            <div class="col-md-6">
                                                <div class="form-group">
                                                    {!! Form::label("ticket_holder_last_name[{$i}][{$ticket['ticket']['id']}]", trans("Public_ViewEvent.last_name")) !!}
                                                    {!! Form::text("ticket_holder_last_name[{$i}][{$ticket['ticket']['id']}]", null, ['required' => 'required', 'class' => "ticket_holder_last_name.$i.{$ticket['ticket']['id']} ticket_holder_last_name form-control"]) !!}
                                                </div>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-md-12">
                                                <div class="form-group">
                                                    {!! Form::label("ticket_holder_email[{$i}][{$ticket['ticket']['id']}]", trans("Public_ViewEvent.email_address")) !!}
                                                    {!! Form::text("ticket_holder_email[{$i}][{$ticket['ticket']['id']}]", null, ['required' => 'required', 'class' => "ticket_holder_email.$i.{$ticket['ticket']['id']} ticket_holder_email form-control"]) !!}
                                                </div>
                                            </div>
                                            @include('Public.ViewEvent.Partials.AttendeeQuestions', ['ticket' => $ticket['ticket'],'attendee_number' => $total_attendee_increment++])

                                        </div>

                                    </div>


                                </div>
                                @endfor
                            @endforeach
                        </div>
                    </div>
                </div>

                <style>
                    .offline_payment_toggle {
                        padding: 20px 0;
                    }
                </style>

                @if($order_requires_payment)

                <h3>@lang("Public_ViewEvent.payment_information")</h3>
                    @lang("Public_ViewEvent.below_payment_information_header")
                @if($event->enable_offline_payments)
                    <div class="offline_payment_toggle">
                        <div class="custom-checkbox">
                            <input data-toggle="toggle" id="pay_offline" name="pay_offline" type="checkbox" value="1">
                            <label for="pay_offline">@lang("Public_ViewEvent.pay_using_offline_methods")</label>
                        </div>
                    </div>
                    <div class="offline_payment" style="display: none;">
                        <h5>@lang("Public_ViewEvent.offline_payment_instructions")</h5>
                        <div class="well">
                            {!! Markdown::parse($event->offline_payment_instructions) !!}
                        </div>
                    </div>

                @endif


                @if(@$payment_gateway->is_on_site)
                    <div class="online_payment">
                        <div class="row">
                            <div class="col-md-12">
                                <div class="form-group">
                                    {!! Form::label('card-number', trans("Public_ViewEvent.card_number")) !!}
                                    @if($payment_gateway->name != 'Stripe')
                                        <input name="card-number" required="required" type="text" autocomplete="off" placeholder="**** **** **** ****" class="form-control card-number" size="20" data-stripe="number">
                                    @else
                                        <input required="required" type="text" autocomplete="off" placeholder="**** **** **** ****" class="form-control card-number" size="20" data-stripe="number">
                                    @endif
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-xs-6">
                                <div class="form-group">
                                    {!! Form::label('card-expiry-month', trans("Public_ViewEvent.expiry_month")) !!}
                                    {!!  Form::selectRange('card-expiry-month',1,12,null, [
                                            'class' => 'form-control card-expiry-month',
                                            'data-stripe' => 'exp_month'
                                        ] )  !!}
                                </div>
                            </div>
                            <div class="col-xs-6">
                                <div class="form-group">
                                    {!! Form::label('card-expiry-year', trans("Public_ViewEvent.expiry_year")) !!}
                                    {!!  Form::selectRange('card-expiry-year',date('Y'),date('Y')+10,null, [
                                            'class' => 'form-control card-expiry-year',
                                            'data-stripe' => 'exp_year'
                                        ] )  !!}</div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-12">
                                <div class="form-group">
                                    {!! Form::label('card-cvc-number', trans("Public_ViewEvent.cvc_number")) !!}
                                    @if($payment_gateway->name != 'Stripe')
                                        <input name="card-cvc" required="required" placeholder="***" class="form-control card-cvc" data-stripe="cvc">
                                    @else
                                        <input required="required" placeholder="***" class="form-control card-cvc" data-stripe="cvc">
                                    @endif
                                </div>
                            </div>
                        </div>
                    </div>

                @endif

                @endif

                @if($event->pre_order_display_message)
                <div class="well well-small">
                    {!! nl2br(e($event->pre_order_display_message)) !!}
                </div>
                @endif

               {!! Form::hidden('is_embedded', $is_embedded) !!}
               {!! Form::submit(trans("Public_ViewEvent.checkout_submit"), ['class' => 'btn btn-lg btn-success card-submit', 'style' => 'width:100%;']) !!}

            </div>
        </div>
    </div>
</section>
@if(session()->get('message'))
    <script>showMessage('{{session()->get('message')}}');</script>
@endif

