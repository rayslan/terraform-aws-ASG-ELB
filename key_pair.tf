resource "aws_key_pair" "key" {
  key_name = "bastion-key" # Add to var
 # Add to var
  public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDXtFZb8It6i8ZfVtrtZq6/EiX0S6Px3Q3icr6JcFZk1jiB0J4LSMmt15qgeb2nRLzmCJim/jECKh+NpfkZn9w0/ng73K13TGQP2iqeY0PNFuvn+2sU2sYtwLvcatHU8XUJjTkAfMMC91Na8HLg/7ERQaq1baIW/OLGzrW0Wzu8uQQHUSdtMHYY575Lwpcl4rgxGPnVuBZlhpFFsfjTRM5v5BHrV+plhFe0V6g6pncGNOd/JoFAJP4baO3MUqs8YVsd4SGVBgThlYVJzW4Cvyb10NPmSdBNtZcqawTxaHge2X1HdyhQFFD0R01XFg2ur00fD8cVB+cyyLaOAzsWz/WV root@ip-172-31-16-55.eu-west-2.compute.internal"
}