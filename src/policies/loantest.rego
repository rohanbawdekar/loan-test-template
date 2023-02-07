package loantest.get

import future.keywords.contains
import future.keywords.if
import future.keywords.in

default approve := false

approval_group contains rule.approvalGroup if {
	some rule in data.rules
	input.resource.amount >= rule.lowerAmountLimit
	input.resource.amount < rule.upperAmountLimit
}

approve if {
input.user.id == input.resource.userId
}
