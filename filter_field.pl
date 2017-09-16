#!/usr/bin/perl
#


open(FCONFIG_FILE, "<config.properties") or die "config.properties can't open, $!";


@compare_field=();
while(<FCONFIG_FILE>)
{
	if ($_ =~ m/compare_field.*=/)
	{
		@compare_field = split(/,/, $');
	}
}

for ($i = 0; $i < @compare_field; $i=$i+1)
{
	print("$compare_field[$i]");
}
close(FCONFIG_FILE);

%field_hash = {};
open(DATAFILE, "<aaa") or die "aaa can't open, $!";

open(OUTFILE, ">out.txt") or die "out.txt can't open, $!";

while (<DATAFILE>)
{
	@fields = split(/\|/, $_);
	$key = "";
	for ($i = 0; $i < @compare_field; $i = $i + 1)
	{
		$key = $key . "$fields[$compare_field[$i]-1]";
	}
	# not the first same, only output current
	if (exists($field_hash{$key}) && $field_hash{$key} == 1)
	{
		# here should save the right fields
		print OUTFILE "$key\n";
	}
	elsif (exists($field_hash{$key}))
	{
		
		# here should save the right fields
		print OUTFILE "$field_hash{key}\n";
		$field_hash{$key} = 1;
	}
	else
	{
		# here should set value to be the right fields
		$field_hash{$key} = ${key};
	}
}
close(DATAFILE);
close(OUTFILE);
