
$note=<>;
$title=<>;
$a=<>;
@headers= split /,/,$a;

open COMMANDS, ">commands.gpl" or die $!;
open DATA, ">data" or die $!;

print COMMANDS "set terminal jpeg\n";
print COMMANDS "set output \"../temp2.jpeg\"\n";

for my $i (1 .. $#headers) {
    $headers[$i] =~ s/\s+$//;
    if ($headers[$i] ne "note") {
	print COMMANDS "plot \"data\" using 1:".($i+1)." title \"$headers[$i]\"\n";
    }
}

$i=0;
while (<>) {
    @d=split /,/;

    for (@d) {
	$_ =~ s/\s+$//;
	print DATA $_."\t";
    }
    print DATA "\n";
    
}

