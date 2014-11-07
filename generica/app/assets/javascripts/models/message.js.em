class Apiv1.Message extends DS.Model
  fromCompany: DS.attr "string"
  senderEmail: DS.attr "string"
  subjectText: DS.attr "string"
  message: DS.attr "string"
  createdAt: DS.attr "date"
  updatedAt: DS.attr "date"  