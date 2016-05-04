#! /usr/bin/perl

# Name:			.pl
# Author:		James M. Lynes, Jr.
# Created:		January 13, 2015
# Modified By:		James M. Lynes, Jr.
# Last Modified:	May 4, 2016
# Environment		Ubuntu 14.04LTS / perl v5.18.2 / wxPerl 3.0.1 / HP 15 Quad Core
# Change Log:		1/13/2015 - Program Created
#			1/6/2016  - Fixed comment error in Sizer section
#			5/4/2016  - Fixed missing Add in Sizer section, Added messagebox and radiobox sections
# Description:		
# Notes:		
#

package main;
use strict;
use warnings;
my $app = App->new();
$app->MainLoop;

package App;
use strict;
use warnings;
use base 'Wx::App';
sub OnInit {
    my $frame = Frame->new();
    $frame->Show(1);
}

package Frame;
use strict;
use warnings;
use Wx qw(:everything);
use base qw(Wx::Frame);
use Data::Dumper;

sub new {
    my ($class, $parent) = @_;

# Create Top Level Frame
    my $self = $class->SUPER::new($parent, -1, "Frame Title", wxDefaultPosition, wxDefaultSize);


# Create Title Text
    $self->{titletext} = Wx::StaticText->new($self, -1, "Title Text", wxDefaultPosition, wxDefaultSize);

# Create Buttons
    $self->{button} = Wx::Button->new($self, -1, "Button Label", wxDefaultPosition, wxDefaultSize);


# Create Data Entry Prompts and Boxes
    $self->{label} = Wx::StaticText->new($self, -1, "Prompt Text", wxDefaultPosition, wxDefaultSize);
    $self->{text} = Wx::TextCtrl->new($self, -1, "Default Value", wxDefaultPosition, wxDefaultSize);

# Create a Messsage/Error Box
    Wx::MessageBox("Multiline\nError\nText", "Message Box Title", wxICON_ERROR, $self);

# Create a Radio Box
    my $choices = [ "A", "B", "C", "D", "E", "F", "G", "H", "I"];
    $self->{radiobox} = Wx::RadioBox->new($self, -1, "Radio Box Title", wxDefaultPosition, wxDefaultSize,
                        $choices, 3, wxRA_SPECIFY_COLS);

# Define Sizer Structure - My "Standard" Layout
# Assumes: One Main Sizer(Vertical)
#          One Header Sizer(Horizontal)
#	   One Body Sizer(Horizontal) containing
#              Left Body Sizer(Vertical)
#              Right Body Sizer(Vertical)
#          Three Footer Sizers(horizontal)
#

# Create Sizers
    my $mainSizer = Wx::BoxSizer->new(wxVERTICAL);
    $self->SetSizer($mainSizer);

    my $headerSizer = Wx::BoxSizer->new(wxHORIZONTAL);
    my $bodySizer = Wx::BoxSizer->new(wxHORIZONTAL);
    my $leftbodySizer = Wx::BoxSizer->new(wxVERTICAL);
    my $rightbodySizer = Wx::BoxSizer->new(wxVERTICAL);
    my $footer1Sizer = Wx::BoxSizer->new(wxHORIZONTAL);
    my $footer2Sizer = Wx::BoxSizer->new(wxHORIZONTAL);
    my $footer3Sizer = Wx::BoxSizer->new(wxHORIZONTAL);

# Layout Main Sizer
    $mainSizer->Add($headerSizer,0,0,0);
    $mainSizer->AddSpacer(20);
    $mainSizer->Add($bodySizer,0,0,0);
    $mainSizer->AddSpacer(30);
    $mainSizer->Add($footer1Sizer,0,0,0);
    $mainSizer->AddSpacer(10);
    $mainSizer->Add($footer2Sizer,0,0,0);
    $mainSizer->AddSpacer(10);
    $mainSizer->Add($footer3Sizer,0,0,0);

# Layout Header Sizer
    $headerSizer->AddSpacer(150);
    $headerSizer->Add($self->{titletext},0,0,0);

# Layout Body Sizer
    $bodySizer->Add($leftbodySizer,0,0,0);
    $bodySizer->AddSpacer(50);
    $bodySizer->Add($rightbodySizer,0,0,0);

# Layout Left and Right Body Sizers
    $leftbodySizer->Add($self->{},0,0,0);
    $rightbodySizer->Add($self->{},0,0,0);

# Layout Footer Sizers
    $footer1Sizer->Add($self->{},0,0,0);
    $footer2Sizer->Add($self->{},0,0,0);
    $footer3Sizer->Add($self->{},0,0,0);

# Assign mainSizer to the Frame and trigger layout

    $mainSizer->Fit($self);
    $mainSizer->Layout();


# Event Handler Template

    Wx::Event::EVT_BUTTON($self, $button, sub {
			  my ($self, $event) = @_;
			  
			  });

    Wx::Event::EVT_TEXT($self, $text, sub {
			my ($self, $event) = @_;
			
			});

# Define Timer
    $self->{timer} = Wx::Timer->new($self);

# Start Timer
    $self->{timer}->Start(1000);		# 1 sec period


    return $self;
}
1;

