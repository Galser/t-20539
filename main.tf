terraform {
  backend "remote" {
    organization = "galser-free"

    workspaces {
      name = "t-20539"
    }
  }
}


module "pet" {
	source = "./modules/pet"

}

module "null" {
	source = "./modules/null"

	null-test = "SHULD BE IN OUT"
}
