�	�mR�X�?�mR�X�?!�mR�X�?	��>3!�2@��>3!�2@!��>3!�2@"e
=type.googleapis.com/tensorflow.profiler.PerGenericStepDetails$�mR�X�?8h���?A�2��V�?Y�D�4�?*	ףp=�\@2U
Iterator::Model::ParallelMapV2�{���G�?!F7�3�,?@)�{���G�?1F7�3�,?@:Preprocessing2F
Iterator::ModelV�Z��?!f r�GI@)�
~b��?1����b3@:Preprocessing2l
5Iterator::Model::ParallelMapV2::Zip[1]::ForeverRepeatB$C��g�?!1�t���4@)Y�e0F�?1�g�RI1@:Preprocessing2f
/Iterator::Model::ParallelMapV2::Zip[0]::FlatMap!?�nJ�?!�(�O�5@)q:�V��?1&D*�=�0@:Preprocessing2Z
#Iterator::Model::ParallelMapV2::Zip�$$�6��?!��ߍk�H@)��ӹ���?1E:F@:Preprocessing2v
?Iterator::Model::ParallelMapV2::Zip[0]::FlatMap[1]::TensorSlice.8��_�v?!h�wHp@).8��_�v?1h�wHp@:Preprocessing2x
AIterator::Model::ParallelMapV2::Zip[1]::ForeverRepeat::FromTensor�,'��p?!x�h�1-@)�,'��p?1x�h�1-@:Preprocessing:�
]Enqueuing data: you may want to combine small input data chunks into fewer but larger chunks.
�Data preprocessing: you may increase num_parallel_calls in <a href="https://www.tensorflow.org/api_docs/python/tf/data/Dataset#map" target="_blank">Dataset map()</a> or preprocess the data OFFLINE.
�Reading data from files in advance: you may tune parameters in the following tf.data API (<a href="https://www.tensorflow.org/api_docs/python/tf/data/Dataset#prefetch" target="_blank">prefetch size</a>, <a href="https://www.tensorflow.org/api_docs/python/tf/data/Dataset#interleave" target="_blank">interleave cycle_length</a>, <a href="https://www.tensorflow.org/api_docs/python/tf/data/TFRecordDataset#class_tfrecorddataset" target="_blank">reader buffer_size</a>)
�Reading data from files on demand: you should read data IN ADVANCE using the following tf.data API (<a href="https://www.tensorflow.org/api_docs/python/tf/data/Dataset#prefetch" target="_blank">prefetch</a>, <a href="https://www.tensorflow.org/api_docs/python/tf/data/Dataset#interleave" target="_blank">interleave</a>, <a href="https://www.tensorflow.org/api_docs/python/tf/data/TFRecordDataset#class_tfrecorddataset" target="_blank">reader buffer</a>)
�Other data reading or processing: you may consider using the <a href="https://www.tensorflow.org/programmers_guide/datasets" target="_blank">tf.data API</a> (if you are not using it now)�
:type.googleapis.com/tensorflow.profiler.BottleneckAnalysis�
both�Your program is MODERATELY input-bound because 18.9% of the total step time sampled is waiting for input. Therefore, you would need to reduce both the input time and other time.no*moderate2t11.8 % of the total step time sampled is spent on 'All Others' time. This could be due to Python execution overhead.9�>3!�2@I P0�wET@Zno>Look at Section 3 for the breakdown of input time on the host.B�
@type.googleapis.com/tensorflow.profiler.GenericStepTimeBreakdown�
	8h���?8h���?!8h���?      ��!       "      ��!       *      ��!       2	�2��V�?�2��V�?!�2��V�?:      ��!       B      ��!       J	�D�4�?�D�4�?!�D�4�?R      ��!       Z	�D�4�?�D�4�?!�D�4�?b      ��!       JCPU_ONLYY�>3!�2@b q P0�wET@Y      Y@q�CgT@"�

both�Your program is MODERATELY input-bound because 18.9% of the total step time sampled is waiting for input. Therefore, you would need to reduce both the input time and other time.b
`input_pipeline_analyzer (especially Section 3 for the breakdown of input operations on the Host)Q
Otf_data_bottleneck_analysis (find the bottleneck in the tf.data input pipeline)m
ktrace_viewer (look at the activities on the timeline of each Host Thread near the bottom of the trace view)"T
Rtensorflow_stats (identify the time-consuming operations executed on the CPU_ONLY)"Z
Xtrace_viewer (look at the activities on the timeline of each CPU_ONLY in the trace view)*�
�<a href="https://www.tensorflow.org/guide/data_performance_analysis" target="_blank">Analyze tf.data performance with the TF Profiler</a>*y
w<a href="https://www.tensorflow.org/guide/data_performance" target="_blank">Better performance with the tf.data API</a>2�
=type.googleapis.com/tensorflow.profiler.GenericRecommendation�
nomoderate"t11.8 % of the total step time sampled is spent on 'All Others' time. This could be due to Python execution overhead.2no:
Refer to the TF2 Profiler FAQb�81.6% of Op time on the host used eager execution. Performance could be improved with <a href="https://www.tensorflow.org/guide/function" target="_blank">tf.function.</a>2"CPU: B 