<?xml version="1.0" encoding="UTF-8" standalone="yes" ?>
<!DOCTYPE boost_serialization>
<boost_serialization signature="serialization::archive" version="15">
  <syndb class_id="0" tracking_level="0" version="0">
    <userIPLatency>-1</userIPLatency>
    <userIPName/>
    <cdfg class_id="1" tracking_level="1" version="0" object_id="_0">
      <name>dense_latency_ap_fixed_ap_fixed_config2_0_0_0</name>
      <ret_bitwidth>15</ret_bitwidth>
      <ports class_id="2" tracking_level="0" version="0">
        <count>1</count>
        <item_version>0</item_version>
        <item class_id="3" tracking_level="1" version="0" object_id="_1">
          <Value class_id="4" tracking_level="0" version="0">
            <Obj class_id="5" tracking_level="0" version="0">
              <type>1</type>
              <id>1</id>
              <name>data_V_read</name>
              <fileName/>
              <fileDirectory/>
              <lineNumber>0</lineNumber>
              <contextFuncName/>
              <inlineStackInfo class_id="6" tracking_level="0" version="0">
                <count>0</count>
                <item_version>0</item_version>
              </inlineStackInfo>
              <originalName>data.V</originalName>
              <rtlName/>
              <coreName/>
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
      </ports>
      <nodes class_id="8" tracking_level="0" version="0">
        <count>7</count>
        <item_version>0</item_version>
        <item class_id="9" tracking_level="1" version="0" object_id="_2">
          <Value>
            <Obj>
              <type>0</type>
              <id>2</id>
              <name>data_V_read_1</name>
              <fileName>firmware/nnet_utils/nnet_dense_latency.h</fileName>
              <fileDirectory>..</fileDirectory>
              <lineNumber>33</lineNumber>
              <contextFuncName>dense_latency&amp;lt;ap_fixed&amp;lt;16, 6, 5, 3, 0&amp;gt;, ap_fixed&amp;lt;16, 6, 5, 3, 0&amp;gt;, config2&amp;gt;</contextFuncName>
              <inlineStackInfo>
                <count>1</count>
                <item_version>0</item_version>
                <item class_id="10" tracking_level="0" version="0">
                  <first>/home/manuelbv/ETHW/model_dummy_linear_2w/hls4ml_prj</first>
                  <second class_id="11" tracking_level="0" version="0">
                    <count>1</count>
                    <item_version>0</item_version>
                    <item class_id="12" tracking_level="0" version="0">
                      <first class_id="13" tracking_level="0" version="0">
                        <first>firmware/nnet_utils/nnet_dense_latency.h</first>
                        <second>dense_latency&amp;lt;ap_fixed&amp;lt;16, 6, 5, 3, 0&amp;gt;, ap_fixed&amp;lt;16, 6, 5, 3, 0&amp;gt;, config2&amp;gt;</second>
                      </first>
                      <second>33</second>
                    </item>
                  </second>
                </item>
              </inlineStackInfo>
              <originalName>data.V</originalName>
              <rtlName/>
              <coreName/>
            </Obj>
            <bitwidth>16</bitwidth>
          </Value>
          <oprand_edges>
            <count>2</count>
            <item_version>0</item_version>
            <item>17</item>
            <item>18</item>
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
        <item class_id_reference="9" object_id="_3">
          <Value>
            <Obj>
              <type>0</type>
              <id>8</id>
              <name>sext_ln1118</name>
              <fileName>firmware/nnet_utils/nnet_mult.h</fileName>
              <fileDirectory>..</fileDirectory>
              <lineNumber>77</lineNumber>
              <contextFuncName>product</contextFuncName>
              <inlineStackInfo>
                <count>1</count>
                <item_version>0</item_version>
                <item>
                  <first>/home/manuelbv/ETHW/model_dummy_linear_2w/hls4ml_prj</first>
                  <second>
                    <count>2</count>
                    <item_version>0</item_version>
                    <item>
                      <first>
                        <first>firmware/nnet_utils/nnet_dense_latency.h</first>
                        <second>dense_latency&amp;lt;ap_fixed&amp;lt;16, 6, 5, 3, 0&amp;gt;, ap_fixed&amp;lt;16, 6, 5, 3, 0&amp;gt;, config2&amp;gt;</second>
                      </first>
                      <second>96</second>
                    </item>
                    <item>
                      <first>
                        <first>firmware/nnet_utils/nnet_mult.h</first>
                        <second>product</second>
                      </first>
                      <second>77</second>
                    </item>
                  </second>
                </item>
              </inlineStackInfo>
              <originalName/>
              <rtlName>sext_ln1118_fu_44_p1</rtlName>
              <coreName/>
            </Obj>
            <bitwidth>20</bitwidth>
          </Value>
          <oprand_edges>
            <count>1</count>
            <item_version>0</item_version>
            <item>19</item>
          </oprand_edges>
          <opcode>sext</opcode>
          <m_Display>0</m_Display>
          <m_isOnCriticalPath>0</m_isOnCriticalPath>
          <m_isLCDNode>0</m_isLCDNode>
          <m_isStartOfPath>0</m_isStartOfPath>
          <m_delay>0.00</m_delay>
          <m_topoIndex>2</m_topoIndex>
          <m_clusterGroupNumber>-1</m_clusterGroupNumber>
        </item>
        <item class_id_reference="9" object_id="_4">
          <Value>
            <Obj>
              <type>0</type>
              <id>9</id>
              <name>shl_ln</name>
              <fileName>firmware/nnet_utils/nnet_mult.h</fileName>
              <fileDirectory>..</fileDirectory>
              <lineNumber>77</lineNumber>
              <contextFuncName>product</contextFuncName>
              <inlineStackInfo>
                <count>1</count>
                <item_version>0</item_version>
                <item>
                  <first>/home/manuelbv/ETHW/model_dummy_linear_2w/hls4ml_prj</first>
                  <second>
                    <count>2</count>
                    <item_version>0</item_version>
                    <item>
                      <first>
                        <first>firmware/nnet_utils/nnet_dense_latency.h</first>
                        <second>dense_latency&amp;lt;ap_fixed&amp;lt;16, 6, 5, 3, 0&amp;gt;, ap_fixed&amp;lt;16, 6, 5, 3, 0&amp;gt;, config2&amp;gt;</second>
                      </first>
                      <second>96</second>
                    </item>
                    <item>
                      <first>
                        <first>firmware/nnet_utils/nnet_mult.h</first>
                        <second>product</second>
                      </first>
                      <second>77</second>
                    </item>
                  </second>
                </item>
              </inlineStackInfo>
              <originalName/>
              <rtlName>shl_ln_fu_48_p3</rtlName>
              <coreName/>
            </Obj>
            <bitwidth>19</bitwidth>
          </Value>
          <oprand_edges>
            <count>3</count>
            <item_version>0</item_version>
            <item>21</item>
            <item>22</item>
            <item>24</item>
          </oprand_edges>
          <opcode>bitconcatenate</opcode>
          <m_Display>0</m_Display>
          <m_isOnCriticalPath>0</m_isOnCriticalPath>
          <m_isLCDNode>0</m_isLCDNode>
          <m_isStartOfPath>0</m_isStartOfPath>
          <m_delay>0.00</m_delay>
          <m_topoIndex>3</m_topoIndex>
          <m_clusterGroupNumber>-1</m_clusterGroupNumber>
        </item>
        <item class_id_reference="9" object_id="_5">
          <Value>
            <Obj>
              <type>0</type>
              <id>10</id>
              <name>sext_ln1118_1</name>
              <fileName>firmware/nnet_utils/nnet_mult.h</fileName>
              <fileDirectory>..</fileDirectory>
              <lineNumber>77</lineNumber>
              <contextFuncName>product</contextFuncName>
              <inlineStackInfo>
                <count>1</count>
                <item_version>0</item_version>
                <item>
                  <first>/home/manuelbv/ETHW/model_dummy_linear_2w/hls4ml_prj</first>
                  <second>
                    <count>2</count>
                    <item_version>0</item_version>
                    <item>
                      <first>
                        <first>firmware/nnet_utils/nnet_dense_latency.h</first>
                        <second>dense_latency&amp;lt;ap_fixed&amp;lt;16, 6, 5, 3, 0&amp;gt;, ap_fixed&amp;lt;16, 6, 5, 3, 0&amp;gt;, config2&amp;gt;</second>
                      </first>
                      <second>96</second>
                    </item>
                    <item>
                      <first>
                        <first>firmware/nnet_utils/nnet_mult.h</first>
                        <second>product</second>
                      </first>
                      <second>77</second>
                    </item>
                  </second>
                </item>
              </inlineStackInfo>
              <originalName/>
              <rtlName>sext_ln1118_1_fu_56_p1</rtlName>
              <coreName/>
            </Obj>
            <bitwidth>20</bitwidth>
          </Value>
          <oprand_edges>
            <count>1</count>
            <item_version>0</item_version>
            <item>25</item>
          </oprand_edges>
          <opcode>sext</opcode>
          <m_Display>0</m_Display>
          <m_isOnCriticalPath>0</m_isOnCriticalPath>
          <m_isLCDNode>0</m_isLCDNode>
          <m_isStartOfPath>0</m_isStartOfPath>
          <m_delay>0.00</m_delay>
          <m_topoIndex>4</m_topoIndex>
          <m_clusterGroupNumber>-1</m_clusterGroupNumber>
        </item>
        <item class_id_reference="9" object_id="_6">
          <Value>
            <Obj>
              <type>0</type>
              <id>11</id>
              <name>sub_ln1118</name>
              <fileName>firmware/nnet_utils/nnet_mult.h</fileName>
              <fileDirectory>..</fileDirectory>
              <lineNumber>77</lineNumber>
              <contextFuncName>product</contextFuncName>
              <inlineStackInfo>
                <count>1</count>
                <item_version>0</item_version>
                <item>
                  <first>/home/manuelbv/ETHW/model_dummy_linear_2w/hls4ml_prj</first>
                  <second>
                    <count>2</count>
                    <item_version>0</item_version>
                    <item>
                      <first>
                        <first>firmware/nnet_utils/nnet_dense_latency.h</first>
                        <second>dense_latency&amp;lt;ap_fixed&amp;lt;16, 6, 5, 3, 0&amp;gt;, ap_fixed&amp;lt;16, 6, 5, 3, 0&amp;gt;, config2&amp;gt;</second>
                      </first>
                      <second>96</second>
                    </item>
                    <item>
                      <first>
                        <first>firmware/nnet_utils/nnet_mult.h</first>
                        <second>product</second>
                      </first>
                      <second>77</second>
                    </item>
                  </second>
                </item>
              </inlineStackInfo>
              <originalName/>
              <rtlName>sub_ln1118_fu_60_p2</rtlName>
              <coreName/>
            </Obj>
            <bitwidth>20</bitwidth>
          </Value>
          <oprand_edges>
            <count>2</count>
            <item_version>0</item_version>
            <item>26</item>
            <item>27</item>
          </oprand_edges>
          <opcode>sub</opcode>
          <m_Display>0</m_Display>
          <m_isOnCriticalPath>0</m_isOnCriticalPath>
          <m_isLCDNode>0</m_isLCDNode>
          <m_isStartOfPath>0</m_isStartOfPath>
          <m_delay>0.56</m_delay>
          <m_topoIndex>5</m_topoIndex>
          <m_clusterGroupNumber>-1</m_clusterGroupNumber>
        </item>
        <item class_id_reference="9" object_id="_7">
          <Value>
            <Obj>
              <type>0</type>
              <id>12</id>
              <name>trunc_ln</name>
              <fileName>firmware/nnet_utils/nnet_mult.h</fileName>
              <fileDirectory>..</fileDirectory>
              <lineNumber>77</lineNumber>
              <contextFuncName>product</contextFuncName>
              <inlineStackInfo>
                <count>1</count>
                <item_version>0</item_version>
                <item>
                  <first>/home/manuelbv/ETHW/model_dummy_linear_2w/hls4ml_prj</first>
                  <second>
                    <count>2</count>
                    <item_version>0</item_version>
                    <item>
                      <first>
                        <first>firmware/nnet_utils/nnet_dense_latency.h</first>
                        <second>dense_latency&amp;lt;ap_fixed&amp;lt;16, 6, 5, 3, 0&amp;gt;, ap_fixed&amp;lt;16, 6, 5, 3, 0&amp;gt;, config2&amp;gt;</second>
                      </first>
                      <second>96</second>
                    </item>
                    <item>
                      <first>
                        <first>firmware/nnet_utils/nnet_mult.h</first>
                        <second>product</second>
                      </first>
                      <second>77</second>
                    </item>
                  </second>
                </item>
              </inlineStackInfo>
              <originalName/>
              <rtlName>ap_return</rtlName>
              <coreName/>
            </Obj>
            <bitwidth>15</bitwidth>
          </Value>
          <oprand_edges>
            <count>4</count>
            <item_version>0</item_version>
            <item>29</item>
            <item>30</item>
            <item>32</item>
            <item>34</item>
          </oprand_edges>
          <opcode>partselect</opcode>
          <m_Display>0</m_Display>
          <m_isOnCriticalPath>0</m_isOnCriticalPath>
          <m_isLCDNode>0</m_isLCDNode>
          <m_isStartOfPath>0</m_isStartOfPath>
          <m_delay>0.00</m_delay>
          <m_topoIndex>6</m_topoIndex>
          <m_clusterGroupNumber>-1</m_clusterGroupNumber>
        </item>
        <item class_id_reference="9" object_id="_8">
          <Value>
            <Obj>
              <type>0</type>
              <id>14</id>
              <name>_ln77</name>
              <fileName>firmware/nnet_utils/nnet_mult.h</fileName>
              <fileDirectory>..</fileDirectory>
              <lineNumber>77</lineNumber>
              <contextFuncName>product</contextFuncName>
              <inlineStackInfo>
                <count>1</count>
                <item_version>0</item_version>
                <item>
                  <first>/home/manuelbv/ETHW/model_dummy_linear_2w/hls4ml_prj</first>
                  <second>
                    <count>2</count>
                    <item_version>0</item_version>
                    <item>
                      <first>
                        <first>firmware/nnet_utils/nnet_dense_latency.h</first>
                        <second>dense_latency&amp;lt;ap_fixed&amp;lt;16, 6, 5, 3, 0&amp;gt;, ap_fixed&amp;lt;16, 6, 5, 3, 0&amp;gt;, config2&amp;gt;</second>
                      </first>
                      <second>96</second>
                    </item>
                    <item>
                      <first>
                        <first>firmware/nnet_utils/nnet_mult.h</first>
                        <second>product</second>
                      </first>
                      <second>77</second>
                    </item>
                  </second>
                </item>
              </inlineStackInfo>
              <originalName/>
              <rtlName/>
              <coreName/>
            </Obj>
            <bitwidth>0</bitwidth>
          </Value>
          <oprand_edges>
            <count>1</count>
            <item_version>0</item_version>
            <item>35</item>
          </oprand_edges>
          <opcode>ret</opcode>
          <m_Display>0</m_Display>
          <m_isOnCriticalPath>0</m_isOnCriticalPath>
          <m_isLCDNode>0</m_isLCDNode>
          <m_isStartOfPath>0</m_isStartOfPath>
          <m_delay>0.00</m_delay>
          <m_topoIndex>7</m_topoIndex>
          <m_clusterGroupNumber>-1</m_clusterGroupNumber>
        </item>
      </nodes>
      <consts class_id="15" tracking_level="0" version="0">
        <count>3</count>
        <item_version>0</item_version>
        <item class_id="16" tracking_level="1" version="0" object_id="_9">
          <Value>
            <Obj>
              <type>2</type>
              <id>23</id>
              <name>empty</name>
              <fileName/>
              <fileDirectory/>
              <lineNumber>0</lineNumber>
              <contextFuncName/>
              <inlineStackInfo>
                <count>0</count>
                <item_version>0</item_version>
              </inlineStackInfo>
              <originalName/>
              <rtlName/>
              <coreName/>
            </Obj>
            <bitwidth>3</bitwidth>
          </Value>
          <const_type>0</const_type>
          <content>0</content>
        </item>
        <item class_id_reference="16" object_id="_10">
          <Value>
            <Obj>
              <type>2</type>
              <id>31</id>
              <name>empty</name>
              <fileName/>
              <fileDirectory/>
              <lineNumber>0</lineNumber>
              <contextFuncName/>
              <inlineStackInfo>
                <count>0</count>
                <item_version>0</item_version>
              </inlineStackInfo>
              <originalName/>
              <rtlName/>
              <coreName/>
            </Obj>
            <bitwidth>32</bitwidth>
          </Value>
          <const_type>0</const_type>
          <content>5</content>
        </item>
        <item class_id_reference="16" object_id="_11">
          <Value>
            <Obj>
              <type>2</type>
              <id>33</id>
              <name>empty</name>
              <fileName/>
              <fileDirectory/>
              <lineNumber>0</lineNumber>
              <contextFuncName/>
              <inlineStackInfo>
                <count>0</count>
                <item_version>0</item_version>
              </inlineStackInfo>
              <originalName/>
              <rtlName/>
              <coreName/>
            </Obj>
            <bitwidth>32</bitwidth>
          </Value>
          <const_type>0</const_type>
          <content>19</content>
        </item>
      </consts>
      <blocks class_id="17" tracking_level="0" version="0">
        <count>1</count>
        <item_version>0</item_version>
        <item class_id="18" tracking_level="1" version="0" object_id="_12">
          <Obj>
            <type>3</type>
            <id>15</id>
            <name>dense_latency&lt;ap_fixed,ap_fixed,config2&gt;.0.0.0</name>
            <fileName/>
            <fileDirectory/>
            <lineNumber>0</lineNumber>
            <contextFuncName/>
            <inlineStackInfo>
              <count>0</count>
              <item_version>0</item_version>
            </inlineStackInfo>
            <originalName/>
            <rtlName/>
            <coreName/>
          </Obj>
          <node_objs>
            <count>7</count>
            <item_version>0</item_version>
            <item>2</item>
            <item>8</item>
            <item>9</item>
            <item>10</item>
            <item>11</item>
            <item>12</item>
            <item>14</item>
          </node_objs>
        </item>
      </blocks>
      <edges class_id="19" tracking_level="0" version="0">
        <count>11</count>
        <item_version>0</item_version>
        <item class_id="20" tracking_level="1" version="0" object_id="_13">
          <id>18</id>
          <edge_type>1</edge_type>
          <source_obj>1</source_obj>
          <sink_obj>2</sink_obj>
          <is_back_edge>0</is_back_edge>
        </item>
        <item class_id_reference="20" object_id="_14">
          <id>19</id>
          <edge_type>1</edge_type>
          <source_obj>2</source_obj>
          <sink_obj>8</sink_obj>
          <is_back_edge>0</is_back_edge>
        </item>
        <item class_id_reference="20" object_id="_15">
          <id>22</id>
          <edge_type>1</edge_type>
          <source_obj>2</source_obj>
          <sink_obj>9</sink_obj>
          <is_back_edge>0</is_back_edge>
        </item>
        <item class_id_reference="20" object_id="_16">
          <id>24</id>
          <edge_type>1</edge_type>
          <source_obj>23</source_obj>
          <sink_obj>9</sink_obj>
          <is_back_edge>0</is_back_edge>
        </item>
        <item class_id_reference="20" object_id="_17">
          <id>25</id>
          <edge_type>1</edge_type>
          <source_obj>9</source_obj>
          <sink_obj>10</sink_obj>
          <is_back_edge>0</is_back_edge>
        </item>
        <item class_id_reference="20" object_id="_18">
          <id>26</id>
          <edge_type>1</edge_type>
          <source_obj>10</source_obj>
          <sink_obj>11</sink_obj>
          <is_back_edge>0</is_back_edge>
        </item>
        <item class_id_reference="20" object_id="_19">
          <id>27</id>
          <edge_type>1</edge_type>
          <source_obj>8</source_obj>
          <sink_obj>11</sink_obj>
          <is_back_edge>0</is_back_edge>
        </item>
        <item class_id_reference="20" object_id="_20">
          <id>30</id>
          <edge_type>1</edge_type>
          <source_obj>11</source_obj>
          <sink_obj>12</sink_obj>
          <is_back_edge>0</is_back_edge>
        </item>
        <item class_id_reference="20" object_id="_21">
          <id>32</id>
          <edge_type>1</edge_type>
          <source_obj>31</source_obj>
          <sink_obj>12</sink_obj>
          <is_back_edge>0</is_back_edge>
        </item>
        <item class_id_reference="20" object_id="_22">
          <id>34</id>
          <edge_type>1</edge_type>
          <source_obj>33</source_obj>
          <sink_obj>12</sink_obj>
          <is_back_edge>0</is_back_edge>
        </item>
        <item class_id_reference="20" object_id="_23">
          <id>35</id>
          <edge_type>1</edge_type>
          <source_obj>12</source_obj>
          <sink_obj>14</sink_obj>
          <is_back_edge>0</is_back_edge>
        </item>
      </edges>
    </cdfg>
    <cdfg_regions class_id="21" tracking_level="0" version="0">
      <count>1</count>
      <item_version>0</item_version>
      <item class_id="22" tracking_level="1" version="0" object_id="_24">
        <mId>1</mId>
        <mTag>dense_latency&lt;ap_fixed,ap_fixed,config2&gt;.0.0.0</mTag>
        <mType>0</mType>
        <sub_regions>
          <count>0</count>
          <item_version>0</item_version>
        </sub_regions>
        <basic_blocks>
          <count>1</count>
          <item_version>0</item_version>
          <item>15</item>
        </basic_blocks>
        <mII>1</mII>
        <mDepth>1</mDepth>
        <mMinTripCount>-1</mMinTripCount>
        <mMaxTripCount>-1</mMaxTripCount>
        <mMinLatency>0</mMinLatency>
        <mMaxLatency>0</mMaxLatency>
        <mIsDfPipe>0</mIsDfPipe>
        <mDfPipe class_id="-1"/>
      </item>
    </cdfg_regions>
    <fsm class_id="24" tracking_level="1" version="0" object_id="_25">
      <states class_id="25" tracking_level="0" version="0">
        <count>1</count>
        <item_version>0</item_version>
        <item class_id="26" tracking_level="1" version="0" object_id="_26">
          <id>1</id>
          <operations class_id="27" tracking_level="0" version="0">
            <count>13</count>
            <item_version>0</item_version>
            <item class_id="28" tracking_level="1" version="0" object_id="_27">
              <id>2</id>
              <stage>1</stage>
              <latency>1</latency>
            </item>
            <item class_id_reference="28" object_id="_28">
              <id>3</id>
              <stage>1</stage>
              <latency>1</latency>
            </item>
            <item class_id_reference="28" object_id="_29">
              <id>4</id>
              <stage>1</stage>
              <latency>1</latency>
            </item>
            <item class_id_reference="28" object_id="_30">
              <id>5</id>
              <stage>1</stage>
              <latency>1</latency>
            </item>
            <item class_id_reference="28" object_id="_31">
              <id>6</id>
              <stage>1</stage>
              <latency>1</latency>
            </item>
            <item class_id_reference="28" object_id="_32">
              <id>7</id>
              <stage>1</stage>
              <latency>1</latency>
            </item>
            <item class_id_reference="28" object_id="_33">
              <id>8</id>
              <stage>1</stage>
              <latency>1</latency>
            </item>
            <item class_id_reference="28" object_id="_34">
              <id>9</id>
              <stage>1</stage>
              <latency>1</latency>
            </item>
            <item class_id_reference="28" object_id="_35">
              <id>10</id>
              <stage>1</stage>
              <latency>1</latency>
            </item>
            <item class_id_reference="28" object_id="_36">
              <id>11</id>
              <stage>1</stage>
              <latency>1</latency>
            </item>
            <item class_id_reference="28" object_id="_37">
              <id>12</id>
              <stage>1</stage>
              <latency>1</latency>
            </item>
            <item class_id_reference="28" object_id="_38">
              <id>13</id>
              <stage>1</stage>
              <latency>1</latency>
            </item>
            <item class_id_reference="28" object_id="_39">
              <id>14</id>
              <stage>1</stage>
              <latency>1</latency>
            </item>
          </operations>
        </item>
      </states>
      <transitions class_id="29" tracking_level="0" version="0">
        <count>0</count>
        <item_version>0</item_version>
      </transitions>
    </fsm>
    <res class_id="30" tracking_level="1" version="0" object_id="_40">
      <dp_component_resource class_id="31" tracking_level="0" version="0">
        <count>0</count>
        <item_version>0</item_version>
      </dp_component_resource>
      <dp_expression_resource>
        <count>1</count>
        <item_version>0</item_version>
        <item class_id="32" tracking_level="0" version="0">
          <first>sub_ln1118_fu_60_p2 ( - ) </first>
          <second class_id="33" tracking_level="0" version="0">
            <count>4</count>
            <item_version>0</item_version>
            <item class_id="34" tracking_level="0" version="0">
              <first>(0P0)</first>
              <second>20</second>
            </item>
            <item>
              <first>(1P1)</first>
              <second>20</second>
            </item>
            <item>
              <first>FF</first>
              <second>0</second>
            </item>
            <item>
              <first>LUT</first>
              <second>20</second>
            </item>
          </second>
        </item>
      </dp_expression_resource>
      <dp_fifo_resource>
        <count>0</count>
        <item_version>0</item_version>
      </dp_fifo_resource>
      <dp_memory_resource>
        <count>0</count>
        <item_version>0</item_version>
      </dp_memory_resource>
      <dp_multiplexer_resource>
        <count>0</count>
        <item_version>0</item_version>
      </dp_multiplexer_resource>
      <dp_register_resource>
        <count>0</count>
        <item_version>0</item_version>
      </dp_register_resource>
      <dp_dsp_resource>
        <count>0</count>
        <item_version>0</item_version>
      </dp_dsp_resource>
      <dp_component_map class_id="35" tracking_level="0" version="0">
        <count>0</count>
        <item_version>0</item_version>
      </dp_component_map>
      <dp_expression_map>
        <count>1</count>
        <item_version>0</item_version>
        <item class_id="36" tracking_level="0" version="0">
          <first>sub_ln1118_fu_60_p2 ( - ) </first>
          <second>
            <count>1</count>
            <item_version>0</item_version>
            <item>11</item>
          </second>
        </item>
      </dp_expression_map>
      <dp_fifo_map>
        <count>0</count>
        <item_version>0</item_version>
      </dp_fifo_map>
      <dp_memory_map>
        <count>0</count>
        <item_version>0</item_version>
      </dp_memory_map>
    </res>
    <node_label_latency class_id="37" tracking_level="0" version="0">
      <count>7</count>
      <item_version>0</item_version>
      <item class_id="38" tracking_level="0" version="0">
        <first>2</first>
        <second class_id="39" tracking_level="0" version="0">
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
      <item>
        <first>11</first>
        <second>
          <first>0</first>
          <second>0</second>
        </second>
      </item>
      <item>
        <first>12</first>
        <second>
          <first>0</first>
          <second>0</second>
        </second>
      </item>
      <item>
        <first>14</first>
        <second>
          <first>0</first>
          <second>0</second>
        </second>
      </item>
    </node_label_latency>
    <bblk_ent_exit class_id="40" tracking_level="0" version="0">
      <count>1</count>
      <item_version>0</item_version>
      <item class_id="41" tracking_level="0" version="0">
        <first>15</first>
        <second class_id="42" tracking_level="0" version="0">
          <first>0</first>
          <second>0</second>
        </second>
      </item>
    </bblk_ent_exit>
    <regions class_id="43" tracking_level="0" version="0">
      <count>1</count>
      <item_version>0</item_version>
      <item class_id="44" tracking_level="1" version="0" object_id="_41">
        <region_name>dense_latency&lt;ap_fixed,ap_fixed,config2&gt;.0.0.0</region_name>
        <basic_blocks>
          <count>1</count>
          <item_version>0</item_version>
          <item>15</item>
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
    <dp_fu_nodes class_id="45" tracking_level="0" version="0">
      <count>6</count>
      <item_version>0</item_version>
      <item class_id="46" tracking_level="0" version="0">
        <first>38</first>
        <second>
          <count>1</count>
          <item_version>0</item_version>
          <item>2</item>
        </second>
      </item>
      <item>
        <first>44</first>
        <second>
          <count>1</count>
          <item_version>0</item_version>
          <item>8</item>
        </second>
      </item>
      <item>
        <first>48</first>
        <second>
          <count>1</count>
          <item_version>0</item_version>
          <item>9</item>
        </second>
      </item>
      <item>
        <first>56</first>
        <second>
          <count>1</count>
          <item_version>0</item_version>
          <item>10</item>
        </second>
      </item>
      <item>
        <first>60</first>
        <second>
          <count>1</count>
          <item_version>0</item_version>
          <item>11</item>
        </second>
      </item>
      <item>
        <first>66</first>
        <second>
          <count>1</count>
          <item_version>0</item_version>
          <item>12</item>
        </second>
      </item>
    </dp_fu_nodes>
    <dp_fu_nodes_expression class_id="48" tracking_level="0" version="0">
      <count>5</count>
      <item_version>0</item_version>
      <item class_id="49" tracking_level="0" version="0">
        <first>sext_ln1118_1_fu_56</first>
        <second>
          <count>1</count>
          <item_version>0</item_version>
          <item>10</item>
        </second>
      </item>
      <item>
        <first>sext_ln1118_fu_44</first>
        <second>
          <count>1</count>
          <item_version>0</item_version>
          <item>8</item>
        </second>
      </item>
      <item>
        <first>shl_ln_fu_48</first>
        <second>
          <count>1</count>
          <item_version>0</item_version>
          <item>9</item>
        </second>
      </item>
      <item>
        <first>sub_ln1118_fu_60</first>
        <second>
          <count>1</count>
          <item_version>0</item_version>
          <item>11</item>
        </second>
      </item>
      <item>
        <first>trunc_ln_fu_66</first>
        <second>
          <count>1</count>
          <item_version>0</item_version>
          <item>12</item>
        </second>
      </item>
    </dp_fu_nodes_expression>
    <dp_fu_nodes_module>
      <count>0</count>
      <item_version>0</item_version>
    </dp_fu_nodes_module>
    <dp_fu_nodes_io>
      <count>1</count>
      <item_version>0</item_version>
      <item>
        <first>data_V_read_1_read_fu_38</first>
        <second>
          <count>1</count>
          <item_version>0</item_version>
          <item>2</item>
        </second>
      </item>
    </dp_fu_nodes_io>
    <return_ports>
      <count>1</count>
      <item_version>0</item_version>
      <item>
        <first>ap_return</first>
        <second>
          <count>1</count>
          <item_version>0</item_version>
          <item>14</item>
        </second>
      </item>
    </return_ports>
    <dp_mem_port_nodes class_id="50" tracking_level="0" version="0">
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
    <dp_port_io_nodes class_id="51" tracking_level="0" version="0">
      <count>1</count>
      <item_version>0</item_version>
      <item class_id="52" tracking_level="0" version="0">
        <first>data_V_read</first>
        <second>
          <count>1</count>
          <item_version>0</item_version>
          <item>
            <first>read</first>
            <second>
              <count>1</count>
              <item_version>0</item_version>
              <item>2</item>
            </second>
          </item>
        </second>
      </item>
    </dp_port_io_nodes>
    <port2core class_id="53" tracking_level="0" version="0">
      <count>0</count>
      <item_version>0</item_version>
    </port2core>
    <node2core>
      <count>0</count>
      <item_version>0</item_version>
    </node2core>
  </syndb>
</boost_serialization>
