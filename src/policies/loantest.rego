package loantest.get

import future.keywords.contains
import future.keywords.if
import future.keywords.in

default approve := false
default approvalBranch := false
default approvalLevel := false
default approvalGroup := false
default approve_user := false
default approve_user_2 := false

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

approver_relations = [ u | u := ds.relation({
  "subject": {"key": approval_group[_], "type" : "group" },
  "relation": {"name": "member", "object_type": "group"}
}) ]

approver_relations_2 = [ u | u := ds.relation({
  "subject": {"key": input.resource.groupId, "type" : "group" },
  "relation": {"name": "member", "object_type": "group"}
}) ]

approvers = [
  u | u := ds.object({"id": approver_relations[_].object.id})
]

approvers_2 = [
  u | u := ds.object({"id": approver_relations_2[_].object.id})
]

approve_user if {
  ds.check_relation({"object": {

  "key": approval_group[_],
  "type": "group"
  },
  "relation": {
  "name": "member",
  "object_type": "group"
  },
  "subject": {
  "id": input.user.id

  }
  })
}


approve_user_2 if {
  input.user.id == approvers[_]
}

approve_user_3 if {
  input.user.userId == approvers_2[_]
}

group_rels = ds.relation({
  "subject": {"id": input.resource.userId},
  "relation": {"name": "member", "object_type": "group"}
})

groups = [
  g | g := ds.object({"id": group_rels[_].object.id})
]

groups_res if {
  input.resource.groupId == groups[_]
}
