def fcfs(processes):
    n = len(processes)
    waiting_time = [0] * n
    turnaround_time = [0] * n

    # Calculate waiting time for each process
    for i in range(1, n):
        waiting_time[i] = waiting_time[i-1] + processes[i-1][1]

    # Calculate turnaround time for each process
    for i in range(n):
        turnaround_time[i] = waiting_time[i] + processes[i][1]

    return waiting_time, turnaround_time

# Example usage:
processes_fcfs = [(1, 6), (2, 8), (3, 7), (4, 3)]
waiting_time_fcfs, turnaround_time_fcfs = fcfs(processes_fcfs)

print("FCFS Scheduling:")
print("Process\tWaiting Time\tTurnaround Time")
for i in range(len(processes_fcfs)):
    print(f"{processes_fcfs[i][0]}\t{waiting_time_fcfs[i]}\t\t{turnaround_time_fcfs[i]}")
