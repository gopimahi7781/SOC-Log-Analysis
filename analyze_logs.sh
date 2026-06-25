#!/bin/bash

echo "=============================="
echo " SOC Log Analysis Report"
echo "=============================="

echo "Total Logs: $(wc -l < security_logs.txt)"
echo "INFO Logs: $(grep -c '^INFO' security_logs.txt)"
echo "WARNING Logs: $(grep -c '^WARNING' security_logs.txt)"
echo "ERROR Logs: $(grep -c '^ERROR' security_logs.txt)"
echo "Failed Login Attempts: $(grep -ic 'failed login' security_logs.txt)"

echo ""
echo "Top Suspicious IP:"
grep -oE '([0-9]{1,3}\.){3}[0-9]{1,3}' security_logs.txt | sort | uniq -c | sort -nr | head -5

echo ""
echo "Analysis Completed."
