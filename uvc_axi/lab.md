o Task-1:-
	
	o Development of axi Template:-
		
		o Create top module
		o Under top module call run_test task
		o Create base_test extends from uvm_test;
			- Register the class to facotry
			- Call the constructor
			- Instantiate Environment
			- Create memory for environment using create method.
			- call print_topology in end_of_elaboration_phase to get hierarchy.
		o Create environment
			- Instantiate agent as master and slave
			- create memory for agents in build_phase
			- Use config_db to set flag for individual agents
		o Create Agent
			- Instantiate sqr,drv,mon,cov,rsp
			- create memory
		// use build_phase and run_phase for all the sub agent components
		o Create sqr
		o create drv
		o create mon
		o create cov // define write method here
		o create rsp
		o Create axi_tx class extending from uvm_sequence_item
		o create list
		o Run in the code in eda playground and get the tb hierarchy.
			

	o Task-2:-
		
		o Create interface
			interface interface_name(input ports);
				// write siganls here
			endinterface

		o Instantiate interface in top as pif.
		o Use config_db and set the pif into database as virtual interface
		o Instantiate interface with virtual keyword and instance name as vif in mon and rsp and drv.
		o Get the interface into the vif handle we declared in the drv,mon,rsp 


	o Task -3:-
		
		o Do the TLM connections between sequencer and driver
			o seq_item_port is available in the uvm_driver
			o seq_item_export is available in the uvm_sequencer
			o Connect method is used to connect the port with export
			o In connect phase of agent do the connection between seq_item_port and seq_item_export
				o Make sure the agent_type is master while connecting the port with implementation

		o Do the TLM connections between mon and cov, mon and sbd
			
			o Declare uvm_analysis_port#(axi_tx) ap_port in the monitor
			o In build_phase create memory for ap_port using new method(constructor)
				- tlm ports are not registered to factory , so create won't work here.
			o uvm_subscriber has analysis_export.
			o SO, we need to connect the ap_port with analysis_export in the connect phase of agent.
				o Make sure the agent_type is master while connecting the port with implementation


			o Declare the macros in the sbd as
				`uvm_analysis_imp_decl(_m)
				`uvm_analysis_imp_decl(_s)

			o Instantiate uvm_analysis_imp_m#(axi_tx,axi_sbd) m_imp;
			o Instantiate uvm_analysis_imp_s#(axi_tx,axi_sbd) s_imp;

			o create memory for the implementations using constructor
			o write the definition for write_s and write_m functions.

			o Connection need to done for mon and sbd 
				o We need to do the connections in the environment connect phase
				o Because sbd in there in the env only.

	o Drive the signals to the interface:-
		
		o Drive the tx signals to the interface from driver.
		o For this we need the following things:
			
			o testcase
			o Sequence

			o in run phase of testcase
				- we need to start the seq at sqr using start method.

			o Before starting the seq at sqr, raise the objection
			o After start method, drop the objection.
			o Give the drain time to make sure that the last tx will drive properly.

			o In the driver run_phase:
				- use forever loop
				- call the get_next_item(req) from the seq_item_port
					seq_item_port.get_next_item(req);
				- drive the req we got.	
					drive_tx(req)
				- Call the req.print() to see the tx happened properly or not.
				- call the item_done on seq_item_port.
					seq_item_port.item_done();
				- write the drive_tx task
					- Here all the tx signals need to assign to the interface signals at posedge clk
					- One p_enable issued, wait for p ready.

			o In the responder run_phase:-
				- use forever loop
				- if we got psel and penable, then issue pready for no wait states
				- if we got psel and penable, then  wait for some clk cycles and issue pready for wait states
				- After that based on the pwrite, store/drive the data into memory /prdata


	o Generate monitor:-
		
		o In run_phase of monitor
			o Use forever block
			o At every posedge
			o If psel and penable and pready happens:
				- then assign all interface signals into tx signals
				- call the write method on ap_port and put tx in it.


	o SBD development:-
		o Get the tx from individual write_methods in to queues.
		o take forever block in teh run_phase
		o wait for the queues to get atleast one data item
		o pop the queue items
		o Compare the two items by using compare method.
		o If compare pass, increament matches and else increment mis_matches.

		o In test, at report_phase:
			- check if mismatches!=0 and matches!=2*count , testfailed
			- else testpass

					


	
				
			
