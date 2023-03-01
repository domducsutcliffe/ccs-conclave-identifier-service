Organisation.destroy_all
Organisation.reset_pk_sequence
Organisation.create!([{
    PPON_ID: "AA1111AA",
    ORG_ID: 12345678
}])

p "Created #{Organisation.count} Organisations"