package loantest.get

import future.keywords.contains
import future.keywords.if
import future.keywords.in

default approve := false

approval_group := data.group

approve if {
  input.user.properties.groups[_] == data.group
}

approve_2 if {
  input.user.properties.groups[_] == approval_group
}

approve_0 if {

  input.user.properties.groups[_] == data.rules[0].approvalGroup
}

approve_1 if {

  input.user.properties.groups[_] == data.rules[1].approvalGroup
}

approve_3 if {

  some i
  input.user.properties.groups[_] == data.rules[i].approvalGroup
}

approve_r1 if {

  input.user.properties.groups[_] == data.rules2["r1"].approvalGroup
}

approve_r11 if {

  input.user.properties.groups[_] == data.rules2[r1].approvalGroup
}


approve_r2 if {

  input.user.properties.groups[_] == data.rules2["r2"].approvalGroup
}

approve_r21 if {

  input.user.properties.groups[_] == data.rules2[r2].approvalGroup
}

approve_r3 if {

  some i
  input.user.properties.groups[_] == data.rules2[i].approvalGroup
}
