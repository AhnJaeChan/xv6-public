	.text

/* Switch from current_thread to next_thread. Make next_thread
 * the current_thread, and set next_thread to 0.
 * Use eax as a temporary register; it is caller saved.
 */
	.globl thread_switch
thread_switch:
	/* YOUR CODE HERE */

	/* Asisstant's hints.
	 * 1. Save context. # pushal
	 * 2. Change %esp
	 * 3. Restore context. # popal
	 * 4. Swap(current_thread, next_thread)
	 */

	 /* Additional search
	  * %eax vs (%eax)
	  * %eax = EAX register
	  * (%eax) = the memory location whose address is contained in the register EAX;
	  */

	pushal // Save context

    // Two lines from here takes care of current_thread = esp
    movl current_thread, %eax
    movl %esp, (%eax)

    // Two lines from here sets esp = next_thread
    movl next_thread, %eax
    movl (%eax), %esp

    // I've first put popal over here because of the assitant's hint #3 but moved it to the back since
    // restoring context should come after all of the switch is done.

    movl %eax, current_thread // Swap current a thread and next_thread
    movl $0, next_thread // Set the next_thread to 0

    popal // Restore context

	ret				/* pop return address from stack */
