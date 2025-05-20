#!/bin/sh

# 🔐 Disable SSL and specify remote master hostname
export JVM_ARGS="-Djava.rmi.server.hostname=master \
-Dserver.rmi.ssl.disable=true \
-Djavax.net.ssl.keyStore= \
-Djavax.net.ssl.keyStorePassword="

# 🧹 Clean up existing report folder
echo "Cleaning existing report folder if it exists..."
if [ -d "/test/${REPORT_FOLDER}" ]; then
  echo "Removing existing /test/${REPORT_FOLDER}..."
  rm -rf "/test/${REPORT_FOLDER}"
fi

# 📂 Create a fresh report directory
mkdir -p "/test/results/${REPORT_FOLDER}"

echo "Starting JMeter test..."

# 🚀 Run JMeter in non-GUI mode with distributed execution
/jmeter/apache-jmeter-${JMETER_VERSION}/bin/jmeter -n \
  -t "/test/BlazeDemoFlight_removed.jmx" \
  -l "/test/results/${REPORT_FOLDER}/results.jtl" \
  -j "/test/results/${REPORT_FOLDER}/jmeter.log" \
  -e -o "/test/results/${REPORT_FOLDER}/html" \
  -R jmeter-agent1,jmeter-agent2

echo "JMeter test execution completed."
