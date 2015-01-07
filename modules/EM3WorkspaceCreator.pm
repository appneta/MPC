package EM3WorkspaceCreator;

# ************************************************************
# Description   : An eMbedded v3 Workspace Creator
# Author        : Chad Elliott
# Create Date   : 7/3/2002
# ************************************************************

# ************************************************************
# Pragmas
# ************************************************************

use strict;

use EM3ProjectCreator;
use VC6WorkspaceCreator;

use vars qw(@ISA);
@ISA = qw(VC6WorkspaceCreator);

# ************************************************************
# Subroutine Section
# ************************************************************


sub workspace_file_extension {
  #my $self = shift;
  return '.vcw';
}


sub pre_workspace {
  my($self, $fh) = @_;
  my $crlf = $self->crlf();

  ## This identifies it as a Visual C++ for WinCE file
  print $fh 'Microsoft eMbedded Visual Tools Workspace File, Format Version 3.00', $crlf;

  ## Optionally print the workspace comment
  $self->print_workspace_comment($fh,
            '#', $crlf,
            '# ', $crlf,
            '#', $crlf,
            '# This file was generated by MPC.  Any changes made directly to', $crlf,
            '# this file will be lost the next time it is generated.', $crlf,
            '#', $crlf,
            '# MPC Command:', $crlf,
            '# ', $self->create_command_line_string($0, @ARGV), $crlf,
            $crlf);
}


1;
