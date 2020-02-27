resource "oci_core_network_security_group" "FoggyKitchenWebSecurityGroup" {
    compartment_id = oci_identity_compartment.FoggyKitchenCompartment.id
    display_name = "FoggyKitchenWebSecurityGroup"
    vcn_id = oci_core_virtual_network.FoggyKitchenVCN.id
}

resource "oci_core_network_security_group" "FoggyKitchenSSHSecurityGroup" {
    compartment_id = oci_identity_compartment.FoggyKitchenCompartment.id
    display_name = "FoggyKitchenSSHSecurityGroup"
    vcn_id = oci_core_virtual_network.FoggyKitchenVCN.id
}

resource "oci_core_network_security_group" "FoggyKitchenATPSecurityGroup" {
    compartment_id = oci_identity_compartment.FoggyKitchenCompartment.id
    display_name = "FoggyKitchenATPSecurityGroup"
    vcn_id = oci_core_virtual_network.FoggyKitchenVCN.id
}