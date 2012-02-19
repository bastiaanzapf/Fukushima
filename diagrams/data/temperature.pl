
$note=<>;
$title=<>;
$a=<>;
@headers= split /,/,$a;

open COMMANDS, ">commands.gpl" or die $!;
open DATA, ">data" or die $!;

print COMMANDS "set terminal jpeg size 1024,768\n";
print COMMANDS "set output \"../temp2.jpeg\"\n";
print COMMANDS "set xdata time\n";
print COMMANDS "set timefmt \"%Y/%m/%d-%H:%M\"\n";
print COMMANDS "set xrange [\"2012/02/01-00:00\":\"2012/02/20-00:00\"]\n";
print COMMANDS "plot";

for my $i (1 .. $#headers) {
    $headers[$i] =~ s/\s+$//;
    if ($i != 1 && $headers[$i] ne "note") {
	print COMMANDS ", \\\n"
    }
    if ($headers[$i] ne "note") {
	print COMMANDS " \"data\" using 1:".($i+1)." title \"$headers[$i]\"";
    }    
}

$i=0;
while (<>) {
    @d=split /,/;

    for (@d) {
	$_ =~ s/\s+$//;
	if ($_ =~ m/20..\//) { # if date, replace space with -
	    $_ =~ s/ /-/;
	}
	print DATA $_."\t";
    }
    print DATA "\n";
    
}

