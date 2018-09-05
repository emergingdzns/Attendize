<footer id="footer" class="container-fluid">
    <div class="container">
        <div class="row">
            <div class="col-md-12">
                @if(Utils::userOwns($organiser))
                    &bull;
                    <a class="adminLink"
                       href="{{route('showOrganiserDashboard' , ['organiser_id' => $organiser->id])}}">@lang("Public_ViewOrganiser.organiser_dashboard")</a>
                @endif
            </div>
        </div>
    </div>
</footer>
