<?xml version="1.0" encoding="UTF-8" standalone="yes" ?>
<!DOCTYPE boost_serialization>
<boost_serialization signature="serialization::archive" version="15">
<syndb class_id="0" tracking_level="0" version="0">
	<userIPLatency>-1</userIPLatency>
	<userIPName></userIPName>
	<cdfg class_id="1" tracking_level="1" version="0" object_id="_0">
		<name>linear_ap_fixed_ap_fixed_16_6_0_0_0_linear_config3_s</name>
		<ret_bitwidth>32</ret_bitwidth>
		<ports class_id="2" tracking_level="0" version="0">
			<count>2</count>
			<item_version>0</item_version>
			<item class_id="3" tracking_level="1" version="0" object_id="_1">
				<Value class_id="4" tracking_level="0" version="0">
					<Obj class_id="5" tracking_level="0" version="0">
						<type>1</type>
						<id>1</id>
						<name>data_0_V_read</name>
						<fileName></fileName>
						<fileDirectory></fileDirectory>
						<lineNumber>0</lineNumber>
						<contextFuncName></contextFuncName>
						<inlineStackInfo class_id="6" tracking_level="0" version="0">
							<count>0</count>
							<item_version>0</item_version>
						</inlineStackInfo>
						<originalName>data[0].V</originalName>
						<rtlName></rtlName>
						<coreName></coreName>
					</Obj>
					<bitwidth>16</bitwidth>
				</Value>
				<direction>0</direction>
				<if_type>0</if_type>
				<array_size>0</array_size>
				<bit_vecs class_id="7" tracking_level="0" version="0">
					<count>0</count>
					<item_version>0</item_version>
				</bit_vecs>
			</item>
			<item class_id_reference="3" object_id="_2">
				<Value>
					<Obj>
						<type>1</type>
						<id>2</id>
						<name>data_1_V_read</name>
						<fileName></fileName>
						<fileDirectory></fileDirectory>
						<lineNumber>0</lineNumber>
						<contextFuncName></contextFuncName>
						<inlineStackInfo>
							<count>0</count>
							<item_version>0</item_version>
						</inlineStackInfo>
						<originalName>data[1].V</originalName>
						<rtlName></rtlName>
						<coreName></coreName>
					</Obj>
					<bitwidth>16</bitwidth>
				</Value>
				<direction>0</direction>
				<if_type>0</if_type>
				<array_size>0</array_size>
				<bit_vecs>
					<count>0</count>
					<item_version>0</item_version>
				</bit_vecs>
			</item>
		</ports>
		<nodes class_id="8" tracking_level="0" version="0">
			<count>5</count>
			<item_version>0</item_version>
			<item class_id="9" tracking_level="1" version="0" object_id="_3">
				<Value>
					<Obj>
						<type>0</type>
						<id>3</id>
						<name>data_1_V_read_1</name>
						<fileName>firmware/nnet_utils/nnet_activation.h</fileName>
						<fileDirectory>/home/manuelbv/ETHW/tutorials/custom/model_dummy_linear_2w/hls4ml_prj</fileDirectory>
						<lineNumber>49</lineNumber>
						<contextFuncName>linear&amp;lt;ap_fixed&amp;lt;16, 6, 5, 3, 0&amp;gt;, ap_fixed&amp;lt;16, 6, 0, 0, 0&amp;gt;, linear_config3&amp;gt;</contextFuncName>
						<inlineStackInfo>
							<count>1</count>
							<item_version>0</item_version>
							<item class_id="10" tracking_level="0" version="0">
								<first>/home/manuelbv/ETHW/tutorials/custom/model_dummy_linear_2w/hls4ml_prj</first>
								<second class_id="11" tracking_level="0" version="0">
									<count>1</count>
									<item_version>0</item_version>
									<item class_id="12" tracking_level="0" version="0">
										<first class_id="13" tracking_level="0" version="0">
											<first>firmware/nnet_utils/nnet_activation.h</first>
											<second>linear&amp;lt;ap_fixed&amp;lt;16, 6, 5, 3, 0&amp;gt;, ap_fixed&amp;lt;16, 6, 0, 0, 0&amp;gt;, linear_config3&amp;gt;</second>
										</first>
										<second>49</second>
									</item>
								</second>
							</item>
						</inlineStackInfo>
						<originalName>data[1].V</originalName>
						<rtlName></rtlName>
						<coreName></coreName>
					</Obj>
					<bitwidth>16</bitwidth>
				</Value>
				<oprand_edges>
					<count>2</count>
					<item_version>0</item_version>
					<item>13</item>
					<item>14</item>
				</oprand_edges>
				<opcode>read</opcode>
				<m_Display>0</m_Display>
				<m_isOnCriticalPath>0</m_isOnCriticalPath>
				<m_isLCDNode>0</m_isLCDNode>
				<m_isStartOfPath>0</m_isStartOfPath>
				<m_delay>0.00</m_delay>
				<m_topoIndex>1</m_topoIndex>
				<m_clusterGroupNumber>-1</m_clusterGroupNumber>
			</item>
			<item class_id_reference="9" object_id="_4">
				<Value>
					<Obj>
						<type>0</type>
						<id>4</id>
						<name>data_0_V_read_1</name>
						<fileName>firmware/nnet_utils/nnet_activation.h</fileName>
						<fileDirectory>/home/manuelbv/ETHW/tutorials/custom/model_dummy_linear_2w/hls4ml_prj</fileDirectory>
						<lineNumber>49</lineNumber>
						<contextFuncName>linear&amp;lt;ap_fixed&amp;lt;16, 6, 5, 3, 0&amp;gt;, ap_fixed&amp;lt;16, 6, 0, 0, 0&amp;gt;, linear_config3&amp;gt;</contextFuncName>
						<inlineStackInfo>
							<count>1</count>
							<item_version>0</item_version>
							<item>
								<first>/home/manuelbv/ETHW/tutorials/custom/model_dummy_linear_2w/hls4ml_prj</first>
								<second>
									<count>1</count>
									<item_version>0</item_version>
									<item>
										<first>
											<first>firmware/nnet_utils/nnet_activation.h</first>
											<second>linear&amp;lt;ap_fixed&amp;lt;16, 6, 5, 3, 0&amp;gt;, ap_fixed&amp;lt;16, 6, 0, 0, 0&amp;gt;, linear_config3&amp;gt;</second>
										</first>
										<second>49</second>
									</item>
								</second>
							</item>
						</inlineStackInfo>
						<originalName>data[0].V</originalName>
						<rtlName></rtlName>
						<coreName></coreName>
					</Obj>
					<bitwidth>16</bitwidth>
				</Value>
				<oprand_edges>
					<count>2</count>
					<item_version>0</item_version>
					<item>15</item>
					<item>16</item>
				</oprand_edges>
				<opcode>read</opcode>
				<m_Display>0</m_Display>
				<m_isOnCriticalPath>0</m_isOnCriticalPath>
				<m_isLCDNode>0</m_isLCDNode>
				<m_isStartOfPath>0</m_isStartOfPath>
				<m_delay>0.00</m_delay>
				<m_topoIndex>2</m_topoIndex>
				<m_clusterGroupNumber>-1</m_clusterGroupNumber>
			</item>
			<item class_id_reference="9" object_id="_5">
				<Value>
					<Obj>
						<type>0</type>
						<id>8</id>
						<name>mrv</name>
						<fileName>firmware/nnet_utils/nnet_activation.h</fileName>
						<fileDirectory>/home/manuelbv/ETHW/tutorials/custom/model_dummy_linear_2w/hls4ml_prj</fileDirectory>
						<lineNumber>61</lineNumber>
						<contextFuncName>linear&amp;lt;ap_fixed&amp;lt;16, 6, 5, 3, 0&amp;gt;, ap_fixed&amp;lt;16, 6, 0, 0, 0&amp;gt;, linear_config3&amp;gt;</contextFuncName>
						<inlineStackInfo>
							<count>1</count>
							<item_version>0</item_version>
							<item>
								<first>/home/manuelbv/ETHW/tutorials/custom/model_dummy_linear_2w/hls4ml_prj</first>
								<second>
									<count>1</count>
									<item_version>0</item_version>
									<item>
										<first>
											<first>firmware/nnet_utils/nnet_activation.h</first>
											<second>linear&amp;lt;ap_fixed&amp;lt;16, 6, 5, 3, 0&amp;gt;, ap_fixed&amp;lt;16, 6, 0, 0, 0&amp;gt;, linear_config3&amp;gt;</second>
										</first>
										<second>61</second>
									</item>
								</second>
							</item>
						</inlineStackInfo>
						<originalName></originalName>
						<rtlName></rtlName>
						<coreName></coreName>
					</Obj>
					<bitwidth>32</bitwidth>
				</Value>
				<oprand_edges>
					<count>2</count>
					<item_version>0</item_version>
					<item>18</item>
					<item>19</item>
				</oprand_edges>
				<opcode>insertvalue</opcode>
				<m_Display>0</m_Display>
				<m_isOnCriticalPath>0</m_isOnCriticalPath>
				<m_isLCDNode>0</m_isLCDNode>
				<m_isStartOfPath>0</m_isStartOfPath>
				<m_delay>0.00</m_delay>
				<m_topoIndex>3</m_topoIndex>
				<m_clusterGroupNumber>-1</m_clusterGroupNumber>
			</item>
			<item class_id_reference="9" object_id="_6">
				<Value>
					<Obj>
						<type>0</type>
						<id>9</id>
						<name>mrv_1</name>
						<fileName>firmware/nnet_utils/nnet_activation.h</fileName>
						<fileDirectory>/home/manuelbv/ETHW/tutorials/custom/model_dummy_linear_2w/hls4ml_prj</fileDirectory>
						<lineNumber>61</lineNumber>
						<contextFuncName>linear&amp;lt;ap_fixed&amp;lt;16, 6, 5, 3, 0&amp;gt;, ap_fixed&amp;lt;16, 6, 0, 0, 0&amp;gt;, linear_config3&amp;gt;</contextFuncName>
						<inlineStackInfo>
							<count>1</count>
							<item_version>0</item_version>
							<item>
								<first>/home/manuelbv/ETHW/tutorials/custom/model_dummy_linear_2w/hls4ml_prj</first>
								<second>
									<count>1</count>
									<item_version>0</item_version>
									<item>
										<first>
											<first>firmware/nnet_utils/nnet_activation.h</first>
											<second>linear&amp;lt;ap_fixed&amp;lt;16, 6, 5, 3, 0&amp;gt;, ap_fixed&amp;lt;16, 6, 0, 0, 0&amp;gt;, linear_config3&amp;gt;</second>
										</first>
										<second>61</second>
									</item>
								</second>
							</item>
						</inlineStackInfo>
						<originalName></originalName>
						<rtlName></rtlName>
						<coreName></coreName>
					</Obj>
					<bitwidth>32</bitwidth>
				</Value>
				<oprand_edges>
					<count>2</count>
					<item_version>0</item_version>
					<item>20</item>
					<item>21</item>
				</oprand_edges>
				<opcode>insertvalue</opcode>
				<m_Display>0</m_Display>
				<m_isOnCriticalPath>0</m_isOnCriticalPath>
				<m_isLCDNode>0</m_isLCDNode>
				<m_isStartOfPath>0</m_isStartOfPath>
				<m_delay>0.00</m_delay>
				<m_topoIndex>4</m_topoIndex>
				<m_clusterGroupNumber>-1</m_clusterGroupNumber>
			</item>
			<item class_id_reference="9" object_id="_7">
				<Value>
					<Obj>
						<type>0</type>
						<id>10</id>
						<name>_ln61</name>
						<fileName>firmware/nnet_utils/nnet_activation.h</fileName>
						<fileDirectory>/home/manuelbv/ETHW/tutorials/custom/model_dummy_linear_2w/hls4ml_prj</fileDirectory>
						<lineNumber>61</lineNumber>
						<contextFuncName>linear&amp;lt;ap_fixed&amp;lt;16, 6, 5, 3, 0&amp;gt;, ap_fixed&amp;lt;16, 6, 0, 0, 0&amp;gt;, linear_config3&amp;gt;</contextFuncName>
						<inlineStackInfo>
							<count>1</count>
							<item_version>0</item_version>
							<item>
								<first>/home/manuelbv/ETHW/tutorials/custom/model_dummy_linear_2w/hls4ml_prj</first>
								<second>
									<count>1</count>
									<item_version>0</item_version>
									<item>
										<first>
											<first>firmware/nnet_utils/nnet_activation.h</first>
											<second>linear&amp;lt;ap_fixed&amp;lt;16, 6, 5, 3, 0&amp;gt;, ap_fixed&amp;lt;16, 6, 0, 0, 0&amp;gt;, linear_config3&amp;gt;</second>
										</first>
										<second>61</second>
									</item>
								</second>
							</item>
						</inlineStackInfo>
						<originalName></originalName>
						<rtlName></rtlName>
						<coreName></coreName>
					</Obj>
					<bitwidth>0</bitwidth>
				</Value>
				<oprand_edges>
					<count>1</count>
					<item_version>0</item_version>
					<item>22</item>
				</oprand_edges>
				<opcode>ret</opcode>
				<m_Display>0</m_Display>
				<m_isOnCriticalPath>0</m_isOnCriticalPath>
				<m_isLCDNode>0</m_isLCDNode>
				<m_isStartOfPath>0</m_isStartOfPath>
				<m_delay>0.00</m_delay>
				<m_topoIndex>5</m_topoIndex>
				<m_clusterGroupNumber>-1</m_clusterGroupNumber>
			</item>
		</nodes>
		<consts class_id="15" tracking_level="0" version="0">
			<count>1</count>
			<item_version>0</item_version>
			<item class_id="16" tracking_level="1" version="0" object_id="_8">
				<Value>
					<Obj>
						<type>2</type>
						<id>17</id>
						<name>empty</name>
						<fileName></fileName>
						<fileDirectory></fileDirectory>
						<lineNumber>0</lineNumber>
						<contextFuncName></contextFuncName>
						<inlineStackInfo>
							<count>0</count>
							<item_version>0</item_version>
						</inlineStackInfo>
						<originalName></originalName>
						<rtlName></rtlName>
						<coreName></coreName>
					</Obj>
					<bitwidth>32</bitwidth>
				</Value>
				<const_type>5</const_type>
				<content>&lt;undef&gt;</content>
			</item>
		</consts>
		<blocks class_id="17" tracking_level="0" version="0">
			<count>1</count>
			<item_version>0</item_version>
			<item class_id="18" tracking_level="1" version="0" object_id="_9">
				<Obj>
					<type>3</type>
					<id>11</id>
					<name>linear&lt;ap_fixed,ap_fixed&lt;16,6,0,0,0&gt;,linear_config3&gt;</name>
					<fileName></fileName>
					<fileDirectory></fileDirectory>
					<lineNumber>0</lineNumber>
					<contextFuncName></contextFuncName>
					<inlineStackInfo>
						<count>0</count>
						<item_version>0</item_version>
					</inlineStackInfo>
					<originalName></originalName>
					<rtlName></rtlName>
					<coreName></coreName>
				</Obj>
				<node_objs>
					<count>5</count>
					<item_version>0</item_version>
					<item>3</item>
					<item>4</item>
					<item>8</item>
					<item>9</item>
					<item>10</item>
				</node_objs>
			</item>
		</blocks>
		<edges class_id="19" tracking_level="0" version="0">
			<count>7</count>
			<item_version>0</item_version>
			<item class_id="20" tracking_level="1" version="0" object_id="_10">
				<id>14</id>
				<edge_type>1</edge_type>
				<source_obj>2</source_obj>
				<sink_obj>3</sink_obj>
				<is_back_edge>0</is_back_edge>
			</item>
			<item class_id_reference="20" object_id="_11">
				<id>16</id>
				<edge_type>1</edge_type>
				<source_obj>1</source_obj>
				<sink_obj>4</sink_obj>
				<is_back_edge>0</is_back_edge>
			</item>
			<item class_id_reference="20" object_id="_12">
				<id>18</id>
				<edge_type>1</edge_type>
				<source_obj>17</source_obj>
				<sink_obj>8</sink_obj>
				<is_back_edge>0</is_back_edge>
			</item>
			<item class_id_reference="20" object_id="_13">
				<id>19</id>
				<edge_type>1</edge_type>
				<source_obj>4</source_obj>
				<sink_obj>8</sink_obj>
				<is_back_edge>0</is_back_edge>
			</item>
			<item class_id_reference="20" object_id="_14">
				<id>20</id>
				<edge_type>1</edge_type>
				<source_obj>8</source_obj>
				<sink_obj>9</sink_obj>
				<is_back_edge>0</is_back_edge>
			</item>
			<item class_id_reference="20" object_id="_15">
				<id>21</id>
				<edge_type>1</edge_type>
				<source_obj>3</source_obj>
				<sink_obj>9</sink_obj>
				<is_back_edge>0</is_back_edge>
			</item>
			<item class_id_reference="20" object_id="_16">
				<id>22</id>
				<edge_type>1</edge_type>
				<source_obj>9</source_obj>
				<sink_obj>10</sink_obj>
				<is_back_edge>0</is_back_edge>
			</item>
		</edges>
	</cdfg>
	<cdfg_regions class_id="21" tracking_level="0" version="0">
		<count>1</count>
		<item_version>0</item_version>
		<item class_id="22" tracking_level="1" version="0" object_id="_17">
			<mId>1</mId>
			<mTag>linear&lt;ap_fixed,ap_fixed&lt;16,6,0,0,0&gt;,linear_config3&gt;</mTag>
			<mType>0</mType>
			<sub_regions>
				<count>0</count>
				<item_version>0</item_version>
			</sub_regions>
			<basic_blocks>
				<count>1</count>
				<item_version>0</item_version>
				<item>11</item>
			</basic_blocks>
			<mII>1</mII>
			<mDepth>1</mDepth>
			<mMinTripCount>-1</mMinTripCount>
			<mMaxTripCount>-1</mMaxTripCount>
			<mMinLatency>0</mMinLatency>
			<mMaxLatency>0</mMaxLatency>
			<mIsDfPipe>0</mIsDfPipe>
			<mDfPipe class_id="-1"></mDfPipe>
		</item>
	</cdfg_regions>
	<fsm class_id="-1"></fsm>
	<res class_id="-1"></res>
	<node_label_latency class_id="26" tracking_level="0" version="0">
		<count>5</count>
		<item_version>0</item_version>
		<item class_id="27" tracking_level="0" version="0">
			<first>3</first>
			<second class_id="28" tracking_level="0" version="0">
				<first>0</first>
				<second>0</second>
			</second>
		</item>
		<item>
			<first>4</first>
			<second>
				<first>0</first>
				<second>0</second>
			</second>
		</item>
		<item>
			<first>8</first>
			<second>
				<first>0</first>
				<second>0</second>
			</second>
		</item>
		<item>
			<first>9</first>
			<second>
				<first>0</first>
				<second>0</second>
			</second>
		</item>
		<item>
			<first>10</first>
			<second>
				<first>0</first>
				<second>0</second>
			</second>
		</item>
	</node_label_latency>
	<bblk_ent_exit class_id="29" tracking_level="0" version="0">
		<count>1</count>
		<item_version>0</item_version>
		<item class_id="30" tracking_level="0" version="0">
			<first>11</first>
			<second class_id="31" tracking_level="0" version="0">
				<first>0</first>
				<second>0</second>
			</second>
		</item>
	</bblk_ent_exit>
	<regions class_id="32" tracking_level="0" version="0">
		<count>1</count>
		<item_version>0</item_version>
		<item class_id="33" tracking_level="1" version="0" object_id="_18">
			<region_name>linear&lt;ap_fixed,ap_fixed&lt;16,6,0,0,0&gt;,linear_config3&gt;</region_name>
			<basic_blocks>
				<count>1</count>
				<item_version>0</item_version>
				<item>11</item>
			</basic_blocks>
			<nodes>
				<count>0</count>
				<item_version>0</item_version>
			</nodes>
			<anchor_node>-1</anchor_node>
			<region_type>8</region_type>
			<interval>1</interval>
			<pipe_depth>1</pipe_depth>
		</item>
	</regions>
	<dp_fu_nodes class_id="34" tracking_level="0" version="0">
		<count>0</count>
		<item_version>0</item_version>
	</dp_fu_nodes>
	<dp_fu_nodes_expression class_id="35" tracking_level="0" version="0">
		<count>0</count>
		<item_version>0</item_version>
	</dp_fu_nodes_expression>
	<dp_fu_nodes_module>
		<count>0</count>
		<item_version>0</item_version>
	</dp_fu_nodes_module>
	<dp_fu_nodes_io>
		<count>0</count>
		<item_version>0</item_version>
	</dp_fu_nodes_io>
	<return_ports>
		<count>0</count>
		<item_version>0</item_version>
	</return_ports>
	<dp_mem_port_nodes class_id="36" tracking_level="0" version="0">
		<count>0</count>
		<item_version>0</item_version>
	</dp_mem_port_nodes>
	<dp_reg_nodes>
		<count>0</count>
		<item_version>0</item_version>
	</dp_reg_nodes>
	<dp_regname_nodes>
		<count>0</count>
		<item_version>0</item_version>
	</dp_regname_nodes>
	<dp_reg_phi>
		<count>0</count>
		<item_version>0</item_version>
	</dp_reg_phi>
	<dp_regname_phi>
		<count>0</count>
		<item_version>0</item_version>
	</dp_regname_phi>
	<dp_port_io_nodes class_id="37" tracking_level="0" version="0">
		<count>0</count>
		<item_version>0</item_version>
	</dp_port_io_nodes>
	<port2core class_id="38" tracking_level="0" version="0">
		<count>0</count>
		<item_version>0</item_version>
	</port2core>
	<node2core>
		<count>0</count>
		<item_version>0</item_version>
	</node2core>
</syndb>
</boost_serialization>

