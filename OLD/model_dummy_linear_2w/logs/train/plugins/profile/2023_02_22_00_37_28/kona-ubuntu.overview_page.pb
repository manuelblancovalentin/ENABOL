�	�n�1��?�n�1��?!�n�1��?	
[0T��/@
[0T��/@!
[0T��/@"e
=type.googleapis.com/tensorflow.profiler.PerGenericStepDetails$�n�1��?)�k{��?A�$��,�?YfO�s�?*	�G�z�\@2U
Iterator::Model::ParallelMapV2C�=�Х?!���,tB@)C�=�Х?1���,tB@:Preprocessing2F
Iterator::Model��MbX�?!:'Z�WM@)A-Ӿ�?1=(CA�5@:Preprocessing2f
/Iterator::Model::ParallelMapV2::Zip[0]::FlatMap�=�
Y�?!��h_�8@)���lɪ�?1�r(��4@:Preprocessing2l
5Iterator::Model::ParallelMapV2::Zip[1]::ForeverRepeat$}ZE�?!H�H�s*@)"ĕ�wF�?1��
��'@:Preprocessing2v
?Iterator::Model::ParallelMapV2::Zip[0]::FlatMap[0]::TensorSlice�)x
�r?!�k ��@)�)x
�r?1�k ��@:Preprocessing2Z
#Iterator::Model::ParallelMapV2::Zipz�]�zk�?!��إ2�D@)������n?1��k�
@:Preprocessing2x
AIterator::Model::ParallelMapV2::Zip[1]::ForeverRepeat::FromTensorZ�rL�_?!Ij��*
�?)Z�rL�_?1Ij��*
�?:Preprocessing:�
]Enqueuing data: you may want to combine small input data chunks into fewer but larger chunks.
�Data preprocessing: you may increase num_parallel_calls in <a href="https://www.tensorflow.org/api_docs/python/tf/data/Dataset#map" target="_blank">Dataset map()</a> or preprocess the data OFFLINE.
�Reading data from files in advance: you may tune parameters in the following tf.data API (<a href="https://www.tensorflow.org/api_docs/python/tf/data/Dataset#prefetch" target="_blank">prefetch size</a>, <a href="https://www.tensorflow.org/api_docs/python/tf/data/Dataset#interleave" target="_blank">interleave cycle_length</a>, <a href="https://www.tensorflow.org/api_docs/python/tf/data/TFRecordDataset#class_tfrecorddataset" target="_blank">reader buffer_size</a>)
�Reading data from files on demand: you should read data IN ADVANCE using the following tf.data API (<a href="https://www.tensorflow.org/api_docs/python/tf/data/Dataset#prefetch" target="_blank">prefetch</a>, <a href="https://www.tensorflow.org/api_docs/python/tf/data/Dataset#interleave" target="_blank">interleave</a>, <a href="https://www.tensorflow.org/api_docs/python/tf/data/TFRecordDataset#class_tfrecorddataset" target="_blank">reader buffer</a>)
�Other data reading or processing: you may consider using the <a href="https://www.tensorflow.org/programmers_guide/datasets" target="_blank">tf.data API</a> (if you are not using it now)�
:type.googleapis.com/tensorflow.profiler.BottleneckAnalysis�
both�Your program is MODERATELY input-bound because 15.9% of the total step time sampled is waiting for input. Therefore, you would need to reduce both the input time and other time.no*moderate2s6.9 % of the total step time sampled is spent on 'All Others' time. This could be due to Python execution overhead.9
[0T��/@I��y�$U@Zno>Look at Section 3 for the breakdown of input time on the host.B�
@type.googleapis.com/tensorflow.profiler.GenericStepTimeBreakdown�
	)�k{��?)�k{��?!)�k{��?      ��!       "      ��!       *      ��!       2	�$��,�?�$��,�?!�$��,�?:      ��!       B      ��!       J	fO�s�?fO�s�?!fO�s�?R      ��!       Z	fO�s�?fO�s�?!fO�s�?b      ��!       JCPU_ONLYY
[0T��/@b q��y�$U@Y      Y@q�*rG� @"�	
both�Your program is MODERATELY input-bound because 15.9% of the total step time sampled is waiting for input. Therefore, you would need to reduce both the input time and other time.b
`input_pipeline_analyzer (especially Section 3 for the breakdown of input operations on the Host)Q
Otf_data_bottleneck_analysis (find the bottleneck in the tf.data input pipeline)m
ktrace_viewer (look at the activities on the timeline of each Host Thread near the bottom of the trace view)"T
Rtensorflow_stats (identify the time-consuming operations executed on the CPU_ONLY)"Z
Xtrace_viewer (look at the activities on the timeline of each CPU_ONLY in the trace view)*�
�<a href="https://www.tensorflow.org/guide/data_performance_analysis" target="_blank">Analyze tf.data performance with the TF Profiler</a>*y
w<a href="https://www.tensorflow.org/guide/data_performance" target="_blank">Better performance with the tf.data API</a>2�
=type.googleapis.com/tensorflow.profiler.GenericRecommendation�
nomoderate"s6.9 % of the total step time sampled is spent on 'All Others' time. This could be due to Python execution overhead.2no:
Refer to the TF2 Profiler FAQ2"CPU: B 