package loan.abac

import future.keywords.contains
import future.keywords.if
import future.keywords.in

default approve := false

approval_group contains rule.approvalGroup if {
	some rule in res.get("data").data.rules
	input.amount >= rule.lowerAmountLimit
	input.amount < rule.upperAmountLimit
}

approver contains group.users[_].userId if {
	some group in res.get("data").data.groups
	group.groupId == approval_group[_]
}

approve if {
	approver[_] == input.user
}
