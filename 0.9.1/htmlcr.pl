#!/usr/bin/perl

############################################
# Autor:          gloriousrootkit          #    
# Version:        0.9.1                    #     
# Name:           htmlcr.pl                #                   
############################################

use File::Copy;
use Term::ANSIColor;
$move;
$enter;
$help = "help";
$nameoffile;
my $username = getusername();
print color ("red"), "htmlcr ulity 1.0.0.2\n", color ("reset");

chomp ($enter = <STDIN>);



if ($enter eq  $help)
{
    print " ";
    print "usage: ./htmlcr.pl [name of new file]\n";
    print " ";
    print "program run under = $username\n";
    
    exit 1;

}else
{
    open (webs, ">$enter.html");
    close webs;

    copy("htmlcrf/html.html","$enter.html") or die "[-]Error\n";
    
    print "move:\n";
    chomp ($move = <STDIN>);
    move ("$enter.html", "/home/$username/$move") or die "[-]Error\n";
    

    print "************************************\n";
    print color("green"), "[+]Proccess done\n", color("reset");
    print "************************************\n";
    

     
}

sub getusername {
    my $user = $ENV{ USERNAME };
    return $user;
}


