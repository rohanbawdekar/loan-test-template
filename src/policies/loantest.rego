package loantest.get

import future.keywords.contains
import future.keywords.if
import future.keywords.in

default approve := false

approval_group := data.groups

approve if {
  input.user.id == input.resource.userId
}
