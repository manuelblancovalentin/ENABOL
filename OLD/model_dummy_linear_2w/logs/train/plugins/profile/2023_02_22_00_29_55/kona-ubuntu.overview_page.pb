�	�Z^��6�?�Z^��6�?!�Z^��6�?	F��u�I3@F��u�I3@!F��u�I3@"e
=type.googleapis.com/tensorflow.profiler.PerGenericStepDetails$�Z^��6�?�*�]gC�?A���w��?Yx*���O�?*	�E���T]@2U
Iterator::Model::ParallelMapV2ge���\�?!�E�	np8@)ge���\�?1�E�	np8@:Preprocessing2f
/Iterator::Model::ParallelMapV2::Zip[0]::FlatMap�����١?!�d	�=@)pw�n�М?1�+�Z��7@:Preprocessing2F
Iterator::Modelh�o}Xo�?!k;�r۪G@)i��i���?1K1��H�6@:Preprocessing2l
5Iterator::Model::ParallelMapV2::Zip[1]::ForeverRepeat[��Y��?!�`�r1@)M����?1T�]a��-@:Preprocessing2v
?Iterator::Model::ParallelMapV2::Zip[0]::FlatMap[0]::TensorSlice7����{?!^r$|�@)7����{?1^r$|�@:Preprocessing2Z
#Iterator::Model::ParallelMapV2::ZipJ�_���?!��-�$UJ@)��M�qz?1��Y�@:Preprocessing2x
AIterator::Model::ParallelMapV2::Zip[1]::ForeverRepeat::FromTensorr��rg&h?!�F�z�@)r��rg&h?1�F�z�@:Preprocessing:�
]Enqueuing data: you may want to combine small input data chunks into fewer but larger chunks.
�Data preprocessing: you may increase num_parallel_calls in <a href="https://www.tensorflow.org/api_docs/python/tf/data/Dataset#map" target="_blank">Dataset map()</a> or preprocess the data OFFLINE.
�Reading data from files in advance: you may tune parameters in the following tf.data API (<a href="https://www.tensorflow.org/api_docs/python/tf/data/Dataset#prefetch" target="_blank">prefetch size</a>, <a href="https://www.tensorflow.org/api_docs/python/tf/data/Dataset#interleave" target="_blank">interleave cycle_length</a>, <a href="https://www.tensorflow.org/api_docs/python/tf/data/TFRecordDataset#class_tfrecorddataset" target="_blank">reader buffer_size</a>)
�Reading data from files on demand: you should read data IN ADVANCE using the following tf.data API (<a href="https://www.tensorflow.org/api_docs/python/tf/data/Dataset#prefetch" target="_blank">prefetch</a>, <a href="https://www.tensorflow.org/api_docs/python/tf/data/Dataset#interleave" target="_blank">interleave</a>, <a href="https://www.tensorflow.org/api_docs/python/tf/data/TFRecordDataset#class_tfrecorddataset" target="_blank">reader buffer</a>)
�Other data reading or processing: you may consider using the <a href="https://www.tensorflow.org/programmers_guide/datasets" target="_blank">tf.data API</a> (if you are not using it now)�
:type.googleapis.com/tensorflow.profiler.BottleneckAnalysis�
both�Your program is MODERATELY input-bound because 19.3% of the total step time sampled is waiting for input. Therefore, you would need to reduce both the input time and other time.no*moderate2s9.2 % of the total step time sampled is spent on 'All Others' time. This could be due to Python execution overhead.9F��u�I3@I.Q���-T@Zno>Look at Section 3 for the breakdown of input time on the host.B�
@type.googleapis.com/tensorflow.profiler.GenericStepTimeBreakdown�
	�*�]gC�?�*�]gC�?!�*�]gC�?      ��!       "      ��!       *      ��!       2	���w��?���w��?!���w��?:      ��!       B      ��!       J	x*���O�?x*���O�?!x*���O�?R      ��!       Z	x*���O�?x*���O�?!x*���O�?b      ��!       JCPU_ONLYYF��u�I3@b q.Q���-T@Y      Y@q p@#�#@"�	
both�Your program is MODERATELY input-bound because 19.3% of the total step time sampled is waiting for input. Therefore, you would need to reduce both the input time and other time.b
`input_pipeline_analyzer (especially Section 3 for the breakdown of input operations on the Host)Q
Otf_data_bottleneck_analysis (find the bottleneck in the tf.data input pipeline)m
ktrace_viewer (look at the activities on the timeline of each Host Thread near the bottom of the trace view)"T
Rtensorflow_stats (identify the time-consuming operations executed on the CPU_ONLY)"Z
Xtrace_viewer (look at the activities on the timeline of each CPU_ONLY in the trace view)*�
�<a href="https://www.tensorflow.org/guide/data_performance_analysis" target="_blank">Analyze tf.data performance with the TF Profiler</a>*y
w<a href="https://www.tensorflow.org/guide/data_performance" target="_blank">Better performance with the tf.data API</a>2�
=type.googleapis.com/tensorflow.profiler.GenericRecommendation�
nomoderate"s9.2 % of the total step time sampled is spent on 'All Others' time. This could be due to Python execution overhead.2no:
Refer to the TF2 Profiler FAQ2"CPU: B 