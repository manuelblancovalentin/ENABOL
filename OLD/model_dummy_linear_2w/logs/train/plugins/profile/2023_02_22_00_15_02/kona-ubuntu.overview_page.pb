�	j�L�:�?j�L�:�?!j�L�:�?	vc�A��5@vc�A��5@!vc�A��5@"e
=type.googleapis.com/tensorflow.profiler.PerGenericStepDetails$j�L�:�?��]Pߢ?A�֊6ǹ�?Y�0�*��?*	q=
ף�c@2f
/Iterator::Model::ParallelMapV2::Zip[0]::FlatMapl��TO�?!3�x��H@)��>rk�?1e8���F@:Preprocessing2F
Iterator::Model���^(`�?!*5�/`�@@)���ّ�?1�i��21@:Preprocessing2U
Iterator::Model::ParallelMapV2����՚?!=��c�0@)����՚?1=��c�0@:Preprocessing2l
5Iterator::Model::ParallelMapV2::Zip[1]::ForeverRepeat���ۂ�?!TQ�R �*@)����m�?1��I|�&@:Preprocessing2Z
#Iterator::Model::ParallelMapV2::Zip�a��?!ke:�O�P@)�Z(���y?1֔ ���@:Preprocessing2v
?Iterator::Model::ParallelMapV2::Zip[0]::FlatMap[0]::TensorSlice��_ѭw?!�L;�,@)��_ѭw?1�L;�,@:Preprocessing2x
AIterator::Model::ParallelMapV2::Zip[1]::ForeverRepeat::FromTensor y�P��h?!��{L d�?) y�P��h?1��{L d�?:Preprocessing:�
]Enqueuing data: you may want to combine small input data chunks into fewer but larger chunks.
�Data preprocessing: you may increase num_parallel_calls in <a href="https://www.tensorflow.org/api_docs/python/tf/data/Dataset#map" target="_blank">Dataset map()</a> or preprocess the data OFFLINE.
�Reading data from files in advance: you may tune parameters in the following tf.data API (<a href="https://www.tensorflow.org/api_docs/python/tf/data/Dataset#prefetch" target="_blank">prefetch size</a>, <a href="https://www.tensorflow.org/api_docs/python/tf/data/Dataset#interleave" target="_blank">interleave cycle_length</a>, <a href="https://www.tensorflow.org/api_docs/python/tf/data/TFRecordDataset#class_tfrecorddataset" target="_blank">reader buffer_size</a>)
�Reading data from files on demand: you should read data IN ADVANCE using the following tf.data API (<a href="https://www.tensorflow.org/api_docs/python/tf/data/Dataset#prefetch" target="_blank">prefetch</a>, <a href="https://www.tensorflow.org/api_docs/python/tf/data/Dataset#interleave" target="_blank">interleave</a>, <a href="https://www.tensorflow.org/api_docs/python/tf/data/TFRecordDataset#class_tfrecorddataset" target="_blank">reader buffer</a>)
�Other data reading or processing: you may consider using the <a href="https://www.tensorflow.org/programmers_guide/datasets" target="_blank">tf.data API</a> (if you are not using it now)�
:type.googleapis.com/tensorflow.profiler.BottleneckAnalysis�
host�Your program is HIGHLY input-bound because 21.8% of the total step time sampled is waiting for input. Therefore, you should first focus on reducing the input time.no*moderate2s8.4 % of the total step time sampled is spent on 'All Others' time. This could be due to Python execution overhead.9uc�A��5@I#瓯��S@Zno>Look at Section 3 for the breakdown of input time on the host.B�
@type.googleapis.com/tensorflow.profiler.GenericStepTimeBreakdown�
	��]Pߢ?��]Pߢ?!��]Pߢ?      ��!       "      ��!       *      ��!       2	�֊6ǹ�?�֊6ǹ�?!�֊6ǹ�?:      ��!       B      ��!       J	�0�*��?�0�*��?!�0�*��?R      ��!       Z	�0�*��?�0�*��?!�0�*��?b      ��!       JCPU_ONLYYuc�A��5@b q#瓯��S@Y      Y@q��-��y!@"�
host�Your program is HIGHLY input-bound because 21.8% of the total step time sampled is waiting for input. Therefore, you should first focus on reducing the input time.b
`input_pipeline_analyzer (especially Section 3 for the breakdown of input operations on the Host)Q
Otf_data_bottleneck_analysis (find the bottleneck in the tf.data input pipeline)m
ktrace_viewer (look at the activities on the timeline of each Host Thread near the bottom of the trace view)"T
Rtensorflow_stats (identify the time-consuming operations executed on the CPU_ONLY)"Z
Xtrace_viewer (look at the activities on the timeline of each CPU_ONLY in the trace view)*�
�<a href="https://www.tensorflow.org/guide/data_performance_analysis" target="_blank">Analyze tf.data performance with the TF Profiler</a>*y
w<a href="https://www.tensorflow.org/guide/data_performance" target="_blank">Better performance with the tf.data API</a>2�
=type.googleapis.com/tensorflow.profiler.GenericRecommendation�
nomoderate"s8.4 % of the total step time sampled is spent on 'All Others' time. This could be due to Python execution overhead.2no:
Refer to the TF2 Profiler FAQ2"CPU: B 