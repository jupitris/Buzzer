#!/usr/bin/perl

use strict;
use warnings;
use Device::SerialPort::Arduino;
use Time::HiRes 'sleep';
use utf8;

my $PI = "3.14159265358979323846264338327950288419716939937510582097494459230781640628620899862803482534211706798214808651328230664709384460955058223172535940812848111745028410270193852110555964462294895493038196";

my $ONE = 440;
my $TWO = 493;
my $THREE = 523;
my $FOUR = 587;
my $FIVE = 659;
my $SIX = 698;
my $SEVEN = 783;
my $EIGHT = 880;
my $NINE = 987;
my $ZERO = 1046;

my $arduino = Device::SerialPort::Arduino->new(
    port     => "/dev/tty.usbmodem411",
    baudrate => 115200,
    databits => 8,
    parity   => "none",
);

my $send_msg = "";
my $time = 10;

for (my $i = 0; $i < length($PI); $i++) {
    my $pi_str = substr($PI, $i, 1);
    print "$pi_str\n";

    if ($pi_str eq "0") {
        $send_msg = sprintf("13, %d, 100\n", $ZERO);
        $arduino->communicate($send_msg)
            or die 'Warning, empty string: ', "$!\n";
    } elsif ($pi_str eq "1") {
        $send_msg = sprintf("13, %d, 100\n", $ONE);
        $arduino->communicate($send_msg)
            or die 'Warning, empty string: ', "$!\n";
    } elsif ($pi_str eq "2") {
        $send_msg = sprintf("13, %d, 100\n", $TWO);
        $arduino->communicate($send_msg)
            or die 'Warning, empty string: ', "$!\n";
    } elsif ($pi_str eq "3") {
        $send_msg = sprintf("13, %d, 100\n", $THREE);
        $arduino->communicate($send_msg)
            or die 'Warning, empty string: ', "$!\n";
    } elsif ($pi_str eq "4") {
        $send_msg = sprintf("13, %d, 100\n", $FOUR);
        $arduino->communicate($send_msg)
            or die 'Warning, empty string: ', "$!\n";
    } elsif ($pi_str eq "5") {
        $send_msg = sprintf("13, %d, 100\n", $FIVE);
        $arduino->communicate($send_msg)
            or die 'Warning, empty string: ', "$!\n";
    } elsif ($pi_str eq "6") {
        $send_msg = sprintf("13, %d, 100\n", $SIX);
        $arduino->communicate($send_msg)
            or die 'Warning, empty string: ', "$!\n";
    } elsif ($pi_str eq "7") {
        $send_msg = sprintf("13, %d, 100\n", $SEVEN);
        $arduino->communicate($send_msg)
            or die 'Warning, empty string: ', "$!\n";
    } elsif ($pi_str eq "8") {
        $send_msg = sprintf("13, %d, 100\n", $EIGHT);
        $arduino->communicate($send_msg)
            or die 'Warning, empty string: ', "$!\n";
    } elsif ($pi_str eq "9") {
        $send_msg = sprintf("13, %d, 100\n", $NINE);
        $arduino->communicate($send_msg)
            or die 'Warning, empty string: ', "$!\n";
    } else {
        $send_msg = sprintf("13, %d, 100\n", 2000);
        $arduino->communicate($send_msg)
            or die 'Warning, empty string: ', "$!\n";
    }

    if ($i > 10) {
        if ($time > 0) {
            $time -= 0.01;
        }
        sleep($time);
    } else {
        sleep(1);
    }
}


