#!/usr/bin/perl

use strict;
use warnings;
use Device::SerialPort::Arduino;
use Time::HiRes 'sleep';
use utf8;

my $PI = "3.14159265358979323846264338327950288419716939937510582097494459230781640628620899862803482534211706798214808651328230664709384460955058223172535940812848111745028410270193852110555964462294895493038196";

my %frequency = (
    "1"  => 440,
    "2"  => 493,
    "3"  => 523,
    "4"  => 587,
    "5"  => 659,
    "6"  => 698,
    "7"  => 783,
    "8"  => 880,
    "9"  => 987,
    "0"  => 1046,
);

my $arduino = Device::SerialPort::Arduino->new(
    port     => "/dev/tty.usbmodem411",
    baudrate => 115200,
    databits => 8,
    parity   => "none",
);

my $send_msg = "";

for (my $i = 0; $i < length($PI); $i++) {
    my $pi_str = substr($PI, $i, 1);
    print "$pi_str\n";

    if (! exists($frequency{$pi_str})) {
        next;
    }

    $send_msg = sprintf("13, %d, 100\n", $frequency{$pi_str});
    $arduino->communicate($send_msg)
        or die 'Warning, empty string: ', "$!\n";

    sleep(1);
}


