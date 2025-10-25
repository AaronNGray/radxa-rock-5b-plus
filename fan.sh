local current_policy available_policies

echo available_policies: `cat /sys/class/thermal/thermal_zone0/available_policies`

echo current_policy: `cat /sys/class/thermal/cooling_device"*/type`

set_thermal_governor() {
    local new_policy="$1" i
    for i in /sys/class/thermal/thermal_zone*/policy
    do
        echo "$new_policy" > "$i"
    done
}

set_thermal_governor "power_allocator"

echo current_policy: `cat /sys/class/thermal/cooling_device"*/type`
