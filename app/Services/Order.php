<?php

namespace App\Services;

use App\Models\Event;
use App\Models\Ticket;

class Order
{

    /**
     * @var float
     */
    private $orderTotal;

    /**
     * @var float
     */
    private $totalBookingFee;

    /**
     * @var float
     */
    private $totalGratuity;

    /**
     * @var Event
     */
    private $event;

    /**
     * @var float
     */
    public $orderTotalWithBookingFee;
    public $orderFullTotalWithBookingFee;

    /**
     * @var float
     */
    public $taxAmount;
    public $taxFullAmount;

    /**
     * @var float
     */
    public $grandTotal;
    public $grandFullTotal;

    /**
     * @var float
     */
    public $balanceDue;

    private $order;


    /**
     * Order constructor.
     * @param $orderTotal
     * @param $totalBookingFee
     * @param $event
     */
    public function __construct($orderTotal, $totalBookingFee, $totalGratuity, $event, $order) {

        $this->orderTotal = $orderTotal;
        $this->totalBookingFee = $totalBookingFee;
        $this->totalGratuity = $totalGratuity;
        $this->event = $event;
        $this->order = $order;
    }


    /**
     * Calculates the final costs for an event and sets the various totals
     */
    public function calculateFinalCosts()
    {
        $this->orderTotalWithBookingFee = $this->orderTotal + $this->totalBookingFee + $this->totalGratuity;

        if ($this->event->organiser->charge_tax == 1 && $this->event->charge_tax == 1) {
            $this->taxAmount = ($this->orderTotalWithBookingFee * $this->event->organiser->tax_value)/100;
        } else {
            $this->taxAmount = 0;
        }

        $this->grandTotal = $this->orderTotalWithBookingFee + $this->taxAmount;
    }
    public function calculateFullFinalCosts()
    {
        $this->orderFullTotalWithBookingFee = $this->order['full']['total'] + $this->order['full']['booking_fee'] + $this->order['full']['gratuity'] + $this->order['full']['organiser_booking_fee'];

        if ($this->event->organiser->charge_tax == 1 && $this->event->charge_tax == 1) {
            $this->taxFullAmount = ($this->orderFullTotalWithBookingFee * $this->event->organiser->tax_value)/100;
        } else {
            $this->taxFullAmount = 0;
        }

        $this->grandFullTotal = $this->orderFullTotalWithBookingFee + $this->taxAmount;
    }

    /**
     * @param bool $currencyFormatted
     * @return float|string
     */
    public function getOrderTotalWithBookingFee($currencyFormatted = false) {

        if ($currencyFormatted == false ) {
            return number_format($this->orderTotalWithBookingFee, 2, '.', '');
        }

        return money($this->orderTotalWithBookingFee, $this->event->currency);
    }
    public function getFullOrderTotalWithBookingFee($currencyFormatted = false) {

        if ($currencyFormatted == false ) {
            return number_format($this->orderFullTotalWithBookingFee, 2, '.', '');
        }

        return money($this->orderFullTotalWithBookingFee, $this->event->currency);
    }

    /**
     * @param bool $currencyFormatted
     * @return float|string
     */
    public function getTaxAmount($currencyFormatted = false) {

        if ($currencyFormatted == false ) {
            return number_format($this->taxAmount, 2, '.', '');
        }

        return money($this->taxAmount, $this->event->currency);
    }
    public function getTaxFullAmount($currencyFormatted = false) {

        if ($currencyFormatted == false ) {
            return number_format($this->taxFullAmount, 2, '.', '');
        }

        return money($this->taxFullAmount, $this->event->currency);
    }

    /**
     * @param bool $currencyFormatted
     * @return float|string
     */
    public function getGrandTotal($currencyFormatted = false) {

        if ($currencyFormatted == false ) {
            return number_format($this->grandTotal, 2, '.', '');
        }

        return money($this->grandFullTotal, $this->event->currency);

    }
    public function getGrandFullTotal($currencyFormatted = false) {

        if ($currencyFormatted == false ) {
            return number_format($this->grandFullTotal, 2, '.', '');
        }

        return money($this->grandFullTotal, $this->event->currency);

    }

    /**
     * @param bool $currencyFormatted
     * @return float|string
     */
    public function getBalanceDue($currencyFormatted = false) {

        if ($currencyFormatted == false ) {
            return number_format(($this->balanceDue + $this->taxFullAmount), 2, '.', '');
        }

        return money(($this->balanceDue + $this->taxFullAmount), $this->event->currency);

    }

    /**
     * @return string
     */
    public function getVatFormattedInBrackets() {
        return "(+" . $this->getTaxAmount(true) . " " . $this->event->organiser->tax_name . ")";
    }
    
}
