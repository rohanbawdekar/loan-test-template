package loantest.get

import future.keywords.contains
import future.keywords.if
import future.keywords.in

default approve := false
default approvalBranch := false
default approvalLevel := false
default approvalGroup := false

approval_level contains data.rules[i].approvalLevel if {
 some i
 input.resource.amount >= data.rules[i].lowerAmountLimit
 input.resource.amount < data.rules[i].upperAmountLimit
}

approval_branch contains data.branches[i].branchId if {
	some i
	data.branches[i].branchId == input.resource.branchId
	approval_level[_] == "branch_office"
}

approval_branch contains data.branches[i].zonalBranch if {
  some i
  data.branches[i].branchId == input.resource.branchId
	approval_level[_] == "zonal_office"
}

approval_branch contains data.branches[i].centralBranch if {
	some i
	data.branches[i].branchId == input.resource.branchId
	approval_level[_] == "central_office"
}

approval_group contains data.branches[i].approvalGroup if {
	some i
	approval_branch[_] == data.branches[i].branchId
}

approve if {
  input.user.properties.groups[_] == approval_group[_]
}

approvalLevel if {
  input.resource.approvalLevel == approval_level[_]
}

approvalGroup if {
  input.resource.approvalGroup == approval_group[_]
}

approvalBranch if {
  input.resource.approvalBranch == approval_branch[_]
}
