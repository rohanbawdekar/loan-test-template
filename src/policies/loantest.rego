{\rtf1\ansi\ansicpg1252\cocoartf2707
\cocoatextscaling0\cocoaplatform0{\fonttbl\f0\fswiss\fcharset0 Helvetica;}
{\colortbl;\red255\green255\blue255;}
{\*\expandedcolortbl;;}
\paperw11900\paperh16840\margl1440\margr1440\vieww13440\viewh7240\viewkind0
\pard\tx566\tx1133\tx1700\tx2267\tx2834\tx3401\tx3968\tx4535\tx5102\tx5669\tx6236\tx6803\pardirnatural\partightenfactor0

\f0\fs24 \cf0 package loan.abac\
\
import future.keywords.contains\
import future.keywords.if\
import future.keywords.in\
\
default approve := false\
\
approval_group contains rule.approvalGroup if \{\
	some rule in res.get("data").data.rules\
	input.amount >= rule.lowerAmountLimit\
	input.amount < rule.upperAmountLimit\
\}\
\
approver contains group.users[_].userId if \{\
	some group in res.get("data").data.groups\
	group.groupId == approval_group[_]\
\}\
\
approve if \{\
	approver[_] == input.user\
\}\
}