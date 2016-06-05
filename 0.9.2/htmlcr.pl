#!/usr/bin/perl

##################################################
# Autor:          gloriousrootkit                #    
# Version:        0.9.2                          #     
# Name:           htmlcr.pl                      #
# Usage:          github/gloriousrootkit/htmlcr  #                   
##################################################

use File::Copy;
use Term::ANSIColor;

$move;
$enter;
$help = "help";
$templates = "lstm";
$nameoffile;
use FindBin '$Bin';
my $username = getusername();


print color ("red"), "htmlcr ulity 0.9.2\n", color ("reset");
chomp ($enter = <STDIN>);



if ($enter eq  $help)
{
    #HELP
    print " usage: ./htmlcr.pl [name of new file]\n";
    print " program run under = $username\n";
    print " list templates : lstm\n";
    print " template folder:";
    print "$Bin/htmlcrf\n";
    print " for more informations visit github/gloriousrootkit/htmlcr\n";
    
    exit 1;

}

elsif ($enter eq $templates)
{
    #LISTTMP
    print "*******************************\n";
   my $templ = "$Bin/htmlcrf";
  
  
    opendir(fl, $templ) or die $!;

    while (my $tems = readdir(fl)) {   
        next if ($tems =~ m/^\./);
	print "$tems\n";
       
    }
    closedir(DIR);
    exit 1;
}

else
{
   
    
    #creat file
    open (webs, ">$enter");
    close webs;
    #select file
    print color ("red"), "[?]template:\n", color ("reset");
    chomp (my $template = <STDIN>);

    my $nost = "$template";
    my @bits = split /\./, $nost;
    my $end = pop @bits;

    copy("htmlcrf/$template","$enter.$end") or die "[-]Error - 1\n", unlink $enter;

  
    print "move:\n";
    chomp ($move = <STDIN>);
    move ("$enter.$end", "/home/$username/$move") or die "[-]Error - 2\n";
    
    unlink("$enter") or die "[-]Error - 3\n";
    print "************************************\n";
    print color("green"), "[+]Proccess done\n", color("reset");
    print "************************************\n";
    

     
}

sub getusername {
    my $user = $ENV{ USER };
    return $user;
}
