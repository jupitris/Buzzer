#!/usr/bin/perl

use strict;
use warnings;
use Device::SerialPort::Arduino;
use Time::HiRes 'sleep';
use utf8;
use Tie::IxHash;

my %frequency = (
    "0"  => 261.62, # C
    "1"  => 293.66, # D
    "2"  => 329.62, # E
    "3"  => 349.22, # F
    "4"  => 391.99, # G
    "5"  => 440,    # A
    "6"  => 493.88, # B
    "7"  => 523.25, # C
    "8"  => 587.32, # D
    "9"  => 659.25, # E
    "10"  => 698.45, # F
    "11"  => 783.99, # G
    "12"  => 880,    # A
    "13"  => 987.76, # B
    "14"  => 1046.50, # C
);

my @jupiter_melody = (
    ["5", 200],
    ["7", 200],
    ["8", 600],
    ["8", 200],
    ["10", 200],
    ["9", 400],
    ["7", 100],
    ["10", 200],
    ["11", 200],
    ["10", 400],
    ["9", 400],
    ["8", 200],
    ["9", 200],
    ["8", 400],
    ["7", 400],
    ["5", 800],
);

my $arduino = Device::SerialPort::Arduino->new(
    port     => "/dev/tty.usbmodem411",
    baudrate => 115200,
    databits => 8,
    parity   => "none",
);

my $send_msg = "";

sleep(3);
for my $key(0..$#jupiter_melody) {
    print "$frequency{$jupiter_melody[$key][0]} : $jupiter_melody[$key][1]\n";

    $send_msg = sprintf("13, %.2f, %d\n", $frequency{$jupiter_melody[$key][0]}, $jupiter_melody[$key][1]);
    $arduino->communicate($send_msg)
        or die 'Warning, empty string: ', "$!\n";
    sleep(1);
}
sleep(3);


