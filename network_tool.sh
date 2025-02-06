LOG_FILE="network_diagnostic_$(date +%Y%m%d_%H%M%S).log"

echo "==== Network Diagnostic Tool ====" | tee -a "$LOG_FILE"
echo "Running diagnostics on $(date)" | tee -a "$LOG_FILE"
echo "--------------------------------------" | tee -a "$LOG_FILE"

# Check Internet connectivity
echo "[+] Checking Internet connectivity..." | tee -a "$LOG_FILE"
ping -c 4 8.8.8.8 | tee -a "$LOG_FILE"

# Resolve DNS for a test domain
echo "[+] Checking DNS resolution..." | tee -a "$LOG_FILE"
dig google.com | tee -a "$LOG_FILE"

# Fetch HTTP headers from a test website
echo "[+] Fetching HTTP headers..." | tee -a "$LOG_FILE"
curl -Is https://www.google.com | tee -a "$LOG_FILE"

# Perform a traceroute to Google
echo "[+] Running traceroute..." | tee -a "$LOG_FILE"
traceroute google.com | tee -a "$LOG_FILE"

# Display active network connections
echo "[+] Displaying active network connections..." | tee -a "$LOG_FILE"
netstat -tulnp | tee -a "$LOG_FILE"

echo "--------------------------------------" | tee -a "$LOG_FILE"
echo "Diagnostics completed. Log saved to $LOG_FILE"
