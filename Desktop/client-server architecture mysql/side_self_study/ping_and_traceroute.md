# Understanding the Ping and traceroute command in Network Troubleshooting and Monitoring.

Computer networks have become the backbone of nearly every business operation. As a network administrator or engineer, understanding the tools at your disposal for monitoring and troubleshooting these networks is crucial.

## What is Ping?

Ping, named for the sound of a returned sonar pulse, is a fundamental tool for testing connectivity in computer networks. It sends Internet Control Message Protocol (ICMP) Echo Request messages to a target host (the device being tested) and waits for a response. If the connection is sound, the host responds with an ICMP Echo Reply. The round-trip time (RTT), the duration for a request to reach the host and for the reply to return, indicates network latency and performance.

## How Does Ping Work?

The operation of the ping command is relatively straightforward, but the details are essential for understanding its use and limitations. When you issue a ping command to a specific address, your device is sending a series of ICMP Echo Request messages to that address. These messages are small data packets that ask for a response.

The ICMP protocol, a part of the Internet Protocol suite, is used by network devices like routers to send error messages and operational information. It’s crucial for network troubleshooting, which is where the ping tool comes in.

The ping performs the following functions:

- Measures the time it takes to get a response or the round-trip time (RTT) in milliseconds.
- Includes in the results the number of bytes received.
- Analyzes the time to live (TTL) that packets need within the network before being discarded by the router.

## When to Ping an IP Address?

Ping is a useful tool for detecting connectivity problems. If you suspect that the connection is not working correctly, running this command can help identify the causes. However, sometimes failures are not evident, so it is recommended to ping devices occasionally.

Some examples where pinging an IP can be useful include:

- Having an online store and wanting to check if the website loads correctly so customers can place their orders.
- If the domain name of a personal blog or e-commerce site is not working, a ping will determine if the incident is related to any of the available IP options.
- Confirming if an electronic device connected to the Wi-Fi network is really online or if a server is operating correctly.
- Analyzing latency if the Internet connection is slow, but also to identify possible loading problems due to poor optimization, even if latency levels are low.

## How Do Ping Commands Look on Screen?

Here are examples of how Ping commands look on screen:

Copy this command to use ping:

```
ping 8.8.8.8
```

In this first image we ping google using it's ip-address to confirm connectivity and it shows we are connected.
<img src="/Users/segunadesokan/Desktop/client-server architecture mysql/side_self_study/Screenshot 2024-05-20 at 16.56.46.png">

```
ping google.com
```

<img src="/Users/segunadesokan/Desktop/client-server architecture mysql/Screenshot 2024-05-20 at 16.59.58.png">

## What is Traceroute & What is it For?

Traceroute is a network diagnostic tool used to track in real-time the pathway taken by a packet on an IP network from source to destination, reporting the IP addresses of all the routers it pinged in between. Traceroute also records the time taken for each hop the packet makes during its route to the destination.

Traceroute most commonly uses Internet Control Message Protocol (ICMP) echo packets with variable time to live (TTL) values. The response time of each hop is calculated. To guarantee accuracy, each hop is queried multiple times (usually three times) to better measure the response of that particular hop. Traceroute uses ICMP messages and TTL fields in the IP address header to function. Traceroute tools are typically included as a utility by operating systems such as Windows and Unix. Traceroute utilities based on TCP are also available.

## What is Traceroute Used For?

Traceroute is a useful tool for determining the response delays and routing loops present in a network pathway across packet switched nodes. It also helps to locate any points of failure encountered while en route to a certain destination.

However, in the Internet, Traceroute messages are often blocked by routers in various Autonomous Systems (AS), making Traceroute highly inaccurate in many cases.

## How to Do a Tracert or Traceroute?

The procedure to perform a Tracert varies depending on the operating system being used. Below, it explains how to do it on iOS.

### Tracert on MacOS / OS X

Just like with ping, there are two ways to do Tracert on OS X:

- Use OS X’s “Network Utility”. It can be found in applications or via Spotlight. Once inside the utility, go to the “Traceroute” tab, enter the domain or IP of the destination, and press the “traceroute” button to perform the diagnostic test.
- Use the Terminal application and type “traceroute” followed by the domain or IP. Then, press Enter to view the test content.

In this below image i used the terminal application

```
traceroute google.com
```

<img src="/Users/segunadesokan/Desktop/client-server architecture mysql/Screenshot 2024-05-20 at 17.11.48.png">

## Conclusion

In conclusion, pinging an IP address and using tracert or traceroute are essential tools for diagnosing and solving problems related to connectivity and the performance of computer networks. Ping allows us to analyze the connection speed and server availability, while tracert shows us the route the connection takes to its final destination, useful for identifying points of failure or packet loss.
