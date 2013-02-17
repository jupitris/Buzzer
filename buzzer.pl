#!/usr/bin/perl

use strict;
use warnings;
use Device::SerialPort::Arduino;
use utf8;

my $arduino = Device::SerialPort::Arduino->new(
    port     => "/dev/tty.usbmodem411",
    baudrate => 115200,
    databits => 8,
    parity   => "none",
);

while (1) {
    my $send_msg = sprintf("13, %d, 80\n", 440);
    $arduino->communicate($send_msg)
        or die 'Warning, empty string: ', "$!\n";
    sleep(1);
}


