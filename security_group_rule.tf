resource "oci_core_network_security_group_security_rule" "FoggyKitchenATPSecurityEgressGroupRule" {
    network_security_group_id = oci_core_network_security_group.FoggyKitchenATPSecurityGroup.id
    direction = "EGRESS"
    protocol = "6"
    destination = var.VCN-CIDR
    destination_type = "CIDR_BLOCK"
}

resource "oci_core_network_security_group_security_rule" "FoggyKitchenATPSecurityIngressGroupRules" {
    network_security_group_id = oci_core_network_security_group.FoggyKitchenATPSecurityGroup.id
    direction = "INGRESS"
    protocol = "6"
    source = var.VCN-CIDR
    source_type = "CIDR_BLOCK"
    tcp_options {
        destination_port_range {
            max = 1522
            min = 1522
        }
    }
}

resource "oci_core_network_security_group_security_rule" "FoggyKitchenWebSecurityEgressATPGroupRule" {
    network_security_group_id = oci_core_network_security_group.FoggyKitchenWebSecurityGroup.id
    direction = "EGRESS"
    protocol = "6"
    destination = oci_core_network_security_group.FoggyKitchenATPSecurityGroup.id
    destination_type = "NETWORK_SECURITY_GROUP"
}

resource "oci_core_network_security_group_security_rule" "FoggyKitchenWebSecurityEgressInternetGroupRule" {
    network_security_group_id = oci_core_network_security_group.FoggyKitchenWebSecurityGroup.id
    direction = "EGRESS"
    protocol = "6"
    destination = "0.0.0.0/0"
    destination_type = "CIDR_BLOCK"
}

resource "oci_core_network_security_group_security_rule" "FoggyKitchenWebSecurityIngressGroupRules" {
    for_each = toset(var.webservice_ports)

    network_security_group_id = oci_core_network_security_group.FoggyKitchenWebSecurityGroup.id
    direction = "INGRESS"
    protocol = "6"
    source = "0.0.0.0/0"
    source_type = "CIDR_BLOCK"
    tcp_options {
        destination_port_range {
            max = each.value
            min = each.value
        }
    }
}

resource "oci_core_network_security_group_security_rule" "FoggyKitchenSSHSecurityEgressGroupRule" {
    network_security_group_id = oci_core_network_security_group.FoggyKitchenSSHSecurityGroup.id
    direction = "EGRESS"
    protocol = "6"
    destination = "0.0.0.0/0"
    destination_type = "CIDR_BLOCK"
}

resource "oci_core_network_security_group_security_rule" "FoggyKitchenSSHSecurityIngressGroupRules" {
    network_security_group_id = oci_core_network_security_group.FoggyKitchenSSHSecurityGroup.id
    direction = "INGRESS"
    protocol = "6"
    source = "0.0.0.0/0"
    source_type = "CIDR_BLOCK"
    tcp_options {
        destination_port_range {
            max = 22
            min = 22
        }
    }
}

