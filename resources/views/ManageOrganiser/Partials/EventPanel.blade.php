<div class="panel panel-success event">
    <div class="panel-heading" data-style="background-color: {{{$event->bg_color}}};background-image: url({{{$event->bg_image_url}}}); background-size: cover;">
        <div class="event-date">
            <div class="month">
                {{strtoupper(explode("|", trans("basic.months_short"))[$event->start_date->format('n')-1])}}
            </div>
            <div class="day">
                {{$event->start_date->format('d')}}
            </div>
        </div>
        <ul class="event-meta">
            <li class="event-title">
                <a title="{{{$event->title}}}" href="{{route('showEventDashboard', ['event_id'=>$event->id])}}">
                    {{{ str_limit($event->title, $limit = 75, $end = '...') }}}
                </a>
            </li>
            <li class="event-organiser">
                By <a href='{{route('showOrganiserDashboard', ['organiser_id' => $event->organiser->id])}}'>{{{$event->organiser->name}}}</a>
            </li>
        </ul>

    </div>

    <div class="panel-body">
        <ul class="nav nav-section nav-justified mt5 mb5">
            <li>
                <div class="section">
                    <h4 class="nm">{{$event->tickets->sum('quantity_sold')}}</h4>
                    <p class="nm text-muted">@lang("Event.tickets_sold")</p>
                </div>
            </li>

            <li>
                <div class="section">
                    <h4 class="nm">{{{money($event->sales_volume + $event->organiser_fees_volume, $event->currency)}}}</h4>
                    <p class="nm text-muted">@lang("Event.revenue")</p>
                </div>
            </li>
        </ul>
    </div>

    <div class="panel-footer">
        <ul class="nav nav-section nav-justified">
            @if(Auth::user()->isAdmin())
                <li>
                    <a href="{{route('duplicateEvent', ['event_id' => $event->id])}}">
                        <i class="ico-copy"></i> Duplicate
                    </a>
                </li>
                @if ($event->deleted_at == '')
                    <li>
                        <a href="{{route('archiveEvent', ['event_id' => $event->id])}}">
                            <i class="ico-archive"></i> Archive
                        </a>
                    </li>
                @else
                    <li>
                        <a href="{{route('restoreEvent', ['event_id' => $event->id])}}">
                            <i class="ico-undo"></i> Restore
                        </a>
                    </li>
                @endif
                <li>
                    <a href="{{route('showEventCustomize', ['event_id' => $event->id])}}">
                        <i class="ico-edit"></i> @lang("basic.edit")
                    </a>
                </li>
            @endif
            <li>
                <a href="{{route('showEventDashboard', ['event_id' => $event->id])}}">
                    <i class="ico-cog"></i> @lang("basic.manage")
                </a>
            </li>
        </ul>
    </div>

</div>