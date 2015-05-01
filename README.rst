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
