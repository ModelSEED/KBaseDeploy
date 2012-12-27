#!/usr/bin/env perl

use Module::Build;
Module::Build->new(
    module_name => 'Bio::KBase::fbaModelServices::Impl',
    license     => 'perl',
    requires => {
        'RPC::Any::Server::JSONRPC::PSGI' => 0,
	'Class::Accessor' => 0,
	'Config::Simple' => 0,
    },
    dist_abstract => 'Dependencies for running FBA server',
)->create_build_script;
