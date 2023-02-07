package loantest.get

import future.keywords.contains
import future.keywords.if
import future.keywords.in

default approve := false

approve if {
input.user.id == input.resource.userId
}
