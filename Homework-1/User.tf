#Users, Groups, Add Users to Group, Import users/add to group

resource "aws_iam_user" "lb" {
  name = "jenny"
}

resource "aws_iam_user" "lb2" {
  name = "rose"
}

resource "aws_iam_user" "lb3" {
  name = "lisa"
}

resource "aws_iam_user" "lb4" {
  name = "jisoo"
}

#Created user miyeon manually in AWS - terraform import aws_iam_user.lb9 miyeon
resource "aws_iam_user" "lb9" {
  name = "miyeon"
}

#Created user mina manually in AWS - terraform import aws_iam_user.lb10 mina
resource "aws_iam_user" "lb10" {
  name = "mina"
}

resource "aws_iam_user" "lb5" {
  name = "jihyo"
}

resource "aws_iam_user" "lb6" {
  name = "sana"
}

resource "aws_iam_user" "lb7" {
  name = "momo"
}

resource "aws_iam_user" "lb8" {
  name = "dahyun"
}

resource "aws_iam_group" "developers" {
  name = "blackpink"
}

resource "aws_iam_group" "developers2" {
  name = "twice"
}

resource "aws_iam_group_membership" "team1" {
  name = "tf-testing-group-membership"

  users = [
    aws_iam_user.lb.name,
    aws_iam_user.lb2.name,
    aws_iam_user.lb3.name,
    aws_iam_user.lb4.name,
    aws_iam_user.lb9.name
    
  ]

  group = aws_iam_group.developers.name
}

resource "aws_iam_group_membership" "team2" {
  name = "tf-testing-group-membership2"

  users = [
    aws_iam_user.lb5.name,
    aws_iam_user.lb6.name,
    aws_iam_user.lb7.name,
    aws_iam_user.lb8.name,
    aws_iam_user.lb10.name
    
  ]

  group = aws_iam_group.developers2.name
}