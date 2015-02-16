actions
ensureOID
  super ensureId.
  self hasOID
    ifFalse: [ self data at: 'oid' put: self id ]