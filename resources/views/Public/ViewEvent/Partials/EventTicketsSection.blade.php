<section id="tickets" class="container">
    <div class="row">
        <h1 class='section_head'>
            @lang("Public_ViewEvent.tickets")
        </h1>
    </div>

    @if($event->end_date->isPast())
        <div class="alert alert-boring">
            @lang("Public_ViewEvent.event_already", ['started' => trans('Public_ViewEvent.event_already_ended')])
        </div>
    @else

        @if($tickets->count() > 0)

            {!! Form::open(['url' => route('postValidateTickets', ['event_id' => $event->id]), 'class' => 'ajax']) !!}
            <div class="row">
                <div class="col-md-12">
                    <div class="content">
                        <div class="tickets_table_wrap">
                            <table class="table">
                                <?php
                                $is_free_event = true;
                                $has_deposit = false;
                                ?>
                                @foreach($tickets as $ticket)
                                    <tr class="ticket" property="offers" typeof="Offer">
                                        <td>
                                            <span class="ticket-title semibold" property="name">
                                                {{$ticket->title}}
                                            </span>
                                            <p class="ticket-descripton mb0 text-muted" property="description">
                                                {{$ticket->description}}
                                                @if ($has_deposit === false && ($event->organiser_fee_fixed > 0 || $event->organiser_fee_percentage > 0 || $event->gratuity_fixed > 0 || $event->gratuity_percentage > 0))
                                                    <br>
                                                    <span class="tax-amount text-muted text-smaller">Ticket Price Includes:
                                                    @if ($ticket->total_booking_fee > 0)
                                                        {{money($ticket->total_booking_fee, $event->currency)}} @lang("Public_ViewEvent.booking_fees")
                                                    @endif
                                                    @if ($ticket->total_booking_fee > 0 and $ticket->gratuity > 0)
                                                        +
                                                    @endif
                                                    @if ($ticket->gratuity > 0)
                                                        {{money($ticket->gratuity, $event->currency)}} @lang("Public_ViewEvent.gratuity")
                                                    @endif
                                                    </span>
                                                @endif
                                            </p>
                                        </td>
                                        @if (($ticket->is_deposit && $ticket->full_price > 0) || $has_deposit)
                                            <?php
                                            $has_deposit = true;
                                            ?>
                                        <td style="width:200px; text-align: center;">
                                            @if($ticket->is_deposit && $ticket->full_price > 0)
                                            Full Price {{money($ticket->full_price, $event->currency)}}
                                            @endif
                                        </td>
                                        @endif
                                        <td style="min-width:200px; text-align: right;">
                                            <div class="ticket-pricing" style="margin-right: 20px;">
                                                @if($ticket->is_free)
                                                    @lang("Public_ViewEvent.free")
                                                    <meta property="price" content="0"> 
                                                @else
                                                    <?php
                                                    $is_free_event = false;
                                                    ?>
                                                    @if ($ticket->is_deposit)
                                                        (Deposit Only)
                                                        <span>{{money($ticket->price, $event->currency)}} </span>
                                                    @else
                                                        <span>{{money($ticket->total_price, $event->currency)}} </span>
                                                        @if ($event->charge_tax)
                                                            <br>
                                                            <span class="tax-amount text-muted text-smaller">{{ ($event->organiser->tax_name && $event->organiser->tax_value) ? '(+'.money(($ticket->total_price*($event->organiser->tax_value)/100), $event->currency).' '.$event->organiser->tax_name.')' : '' }}</span>
                                                        @endif
                                                    @endif
                                                    <meta property="priceCurrency"
                                                          content="{{ $event->currency->code }}">
                                                    <meta property="price"
                                                          content="{{ number_format($ticket->price, 2, '.', '') }}">
                                                @endif
                                            </div>
                                        </td>
                                        <td style="width:85px;">
                                            @if($ticket->is_paused)

                                                <span class="text-danger">
                                    @lang("Public_ViewEvent.currently_not_on_sale")
                                </span>

                                            @else

                                                @if($ticket->sale_status === config('attendize.ticket_status_sold_out'))
                                                    <span class="text-danger" property="availability"
                                                          content="http://schema.org/SoldOut">
                                    @lang("Public_ViewEvent.sold_out")
                                </span>
                                                @elseif($ticket->sale_status === config('attendize.ticket_status_before_sale_date'))
                                                    <span class="text-danger">
                                    @lang("Public_ViewEvent.sales_have_not_started")
                                </span>
                                                @elseif($ticket->sale_status === config('attendize.ticket_status_after_sale_date'))
                                                    <span class="text-danger">
                                    @lang("Public_ViewEvent.sales_have_ended")
                                </span>
                                                @else
                                                    {!! Form::hidden('tickets[]', $ticket->id) !!}
                                                    <meta property="availability" content="http://schema.org/InStock">
                                                    <select name="ticket_{{$ticket->id}}" class="form-control"
                                                            style="text-align: center">
                                                        @if ($tickets->count() > 1)
                                                            <option value="0">0</option>
                                                        @endif
                                                        @for($i=$ticket->min_per_person; $i<=$ticket->max_per_person; $i++)
                                                            <option value="{{$i}}">{{$i}}</option>
                                                        @endfor
                                                    </select>
                                                @endif

                                            @endif
                                        </td>
                                    </tr>
                                @endforeach

                                    <tr>
                                        <td colspan="@if($has_deposit) 4 @else 3 @endif" style="text-align: center">
                                            @lang("Public_ViewEvent.below_tickets")
                                        </td>
                                    </tr>
                                <tr class="checkout">
                                    <td colspan="@if($has_deposit) 4 @else 3 @endif">
                                        @if(!$is_free_event)
                                            <div class="hidden-xs pull-left">
                                                <img class=""
                                                     src="{{asset('assets/images/public/EventPage/credit-card-logos.png')}}"/>
                                                @if($event->enable_offline_payments)

                                                    <div class="help-block" style="font-size: 11px;">
                                                        @lang("Public_ViewEvent.offline_payment_methods_available")
                                                    </div>
                                                @endif
                                            </div>

                                        @endif
                                        {!!Form::submit(trans("Public_ViewEvent.register"), ['class' => 'btn btn-lg btn-primary pull-right'])!!}
                                    </td>
                                </tr>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
            {!! Form::hidden('is_embedded', $is_embedded) !!}
            {!! Form::close() !!}

        @else

            <div class="alert alert-boring">
                @lang("Public_ViewEvent.tickets_are_currently_unavailable")
            </div>

        @endif

    @endif

</section>
