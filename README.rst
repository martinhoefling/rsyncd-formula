.. image:: https://travis-ci.org/martinhoefling/rsyncd-formula.svg?branch=master
    :target: https://travis-ci.org/martinhoefling/rsyncd-formula

================
rsyncd-formula
================

A formula to install and configure rsync as daemon process.

.. note::

    See the full `Salt Formulas installation and usage instructions
    <http://docs.saltstack.com/en/latest/topics/development/conventions/formulas.html>`_.

Available states
================

.. contents::
    :local:

``rsyncd``
------------

Installs the rsync package, and starts the rsyncd service.

``rsyncd.config``
------------

Configure the rsync daemon by writing an rsync.conf and rsync secrets (optional).

Testing
=======

As you can read in .travis.yml, testing is a matter of symlinking this
directory to /srv/formula (because we can't use relative paths in file_roots /
pillar_roots) and running::

  salt-call state.show_highstate --local --retcode-passthrough --config-dir=test/etc
