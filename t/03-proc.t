#!/usr/bin/env perl6

use lib 't/lib';
use Pluggable;
use Test;

plan 5;

my @expected = [
        'CaseA::Plugins::Class1',
        'CaseA::Plugins::Class2',
	'CaseA::Plugins::Class3'
    ];

my @plugins = plugins('CaseA');
ok @plugins.map({ .WHAT.perl }).sort eqv @expected.sort;
ok @plugins[1].new().works-name eq 'This program', "Instance works";

# Try again
@plugins = plugins('CaseA');
ok @plugins.map({ .WHAT.perl }).sort eqv @expected.sort, "Reload";
ok @plugins[1].new().works-name eq 'This program', "Instance works too";
ok @plugins[1].new().gimme-ten eq 'ten', "Mixed in works too";
