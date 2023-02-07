package loantest.get

import future.keywords.contains
import future.keywords.if
import future.keywords.in

default approve := false

approval_group := data.group

approve if {
  input.user.properties.groups[_] == approval_group
}
