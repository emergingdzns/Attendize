<?php

return [

    'version' => file_get_contents(base_path('VERSION')),

    'ticket_status_sold_out'        => 1,
    'ticket_status_after_sale_date' => 2,//
    'enable_test_payments'          => env('ENABLE_TEST_PAYMENTS', false),
    'enable_dummy_payment_gateway'  => false,
    'payment_gateway_dummy'    => 0,
    'payment_gateway_stripe'   => 1,
    'payment_gateway_paypal'   => 2,
    'payment_gateway_bluepay'  => 6,
    'fake_card_data' => [
        'number' => '4242424242424242',
        'expiryMonth' => '6',
        'expiryYear' => '2030',
        'cvv' => '123'
    ],
    'outgoing_email_noreply' => env('MAIL_FROM_ADDRESS'),
    'outgoing_email'         => env('MAIL_FROM_ADDRESS'),
    'outgoing_email_name'    => env('MAIL_FROM_NAME'),
    'incoming_email'         => env('MAIL_FROM_ADDRESS'),

    'app_name'               => 'Attendize Event Ticketing',
    'event_default_bg_color' => '#B23333',
    'event_default_bg_image' => 'assets/images/public/EventPage/backgrounds/5.jpg',

    'event_images_path'      => 'user_content/event_images',
    'organiser_images_path'  => 'user_content/organiser_images',
    'event_pdf_tickets_path' => 'user_content/pdf_tickets',
    'event_bg_images'        => 'assets/images/public/EventPage/backgrounds',

    'fallback_organiser_logo_url' => '/assets/images/logo-dark.png',
    'cdn_url'                     => '',

    'checkout_timeout_after' => env('CHECKOUT_TIMEOUT_AFTER', 30), #minutes

    'ticket_status_before_sale_date' => 3,
    'ticket_status_on_sale'          => 4,
    'ticket_status_off_sale'         => 5,

    'ticket_booking_fee_fixed'      => 0,
    'ticket_booking_fee_percentage' => 0,

    /* Order statuses */
    'order_complete'                => 1,
    'order_refunded'                => 2,
    'order_partially_refunded'      => 3,
    'order_cancelled'               => 4,
    'order_awaiting_payment'        => 5,

    /* Attendee question types */
    'question_textbox_single'       => 1,
    'question_textbox_multi'        => 2,
    'question_dropdown_single'      => 3,
    'question_dropdown_multi'       => 4,
    'question_checkbox_multi'       => 5,
    'question_radio_single'         => 6,


    'default_timezone'           => 30, #Europe/Dublin
    'default_currency'           => 2, #Euro
    'default_date_format'        => env('DEFAULT_DATE_FORMAT','Y-m-d'),
    'default_date_picker_format' => env('DEFAULT_DATEPICKER_FORMAT','MM-dd-yyyy hh:mm AA'),
    'default_datetime_format'    => env('DEFAULT_DATETIME_FORMAT','m-d-Y h:i a'),
    'default_query_cache'        => 120, #Minutes
    'default_locale'             => 'en',
    'default_payment_gateway'    => env('DEFAULT_PAYMENT_GATEWAY',6), #Stripe=1 Paypal=2 BitPay=3 MIGS=4 bluepay=6

    'cdn_url_user_assets'   => '',
    'cdn_url_static_assets' => '',

    'display_datetime_format' => 'M j, Y h:i a',
    'display_date_format'     => 'M j, Y',
    'display_time_format'     => 'h:i a'
];
